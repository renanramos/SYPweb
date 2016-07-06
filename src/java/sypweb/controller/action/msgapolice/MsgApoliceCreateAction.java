package sypweb.controller.action.msgapolice;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypweb.model.pojo.Apolice;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.ApoliceDAO;
import sypweb.model.pojo.Mensagem;
import sypweb.model.pojo.MensagemApolice;
import sypweb.model.pojo.Usuario;

public class MsgApoliceCreateAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        try{
            Long paramId = input.getLong("id");
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            Mensagem mensagem = new Mensagem();
            if (paramId > 0){
                mensagem = ServiceLocator.getMensagemService().readById(paramId);
            }
            else{                
                mensagem.setDescricao(input.getString("descricao"));
                mensagem.setUsuario(usuariologado);
                ServiceLocator.getMensagemService().create(mensagem);
            }
            Long id = mensagem.getId();
            String selecao = input.getString("modoEnvio");
            Map<String, Object> criteria = new HashMap<String, Object>();
            List<String> listaApolices = new ArrayList<String>();
            Boolean enviaApolices = false;
            
            if (selecao != null && selecao.equals("todos")) { //Todos segurados
                if (usuariologado.getTipo().equals("administrador")) {
                    criteria.put(ApoliceDAO.CRITERION_ALL, "");
                } else if (usuariologado.getTipo().equals("corretor")) {
                    criteria.put(sypseguradora.model.dao.ApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());
                    List<sypseguradora.model.pojo.Apolice> apoCorr = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);
                    for (int i = 0; i < apoCorr.size(); i++) {
                        listaApolices.add(apoCorr.get(i).getApolice());
                    }
                    criteria.put(ApoliceDAO.CRITERION_APOLICES, listaApolices);
                }
                enviaApolices = true;
            } else if (selecao != null && selecao.equals("selecionado")){          //Seleção de segurados
                String lista = input.getString("tokenfield-1");
                String[] aux = lista.split(",");

                for (int i = 0; i < aux.length; i++) {
                    listaApolices.add(aux[i].substring(aux[i].lastIndexOf("(") +1,aux[i].lastIndexOf(")")));
                }
                criteria.put(ApoliceDAO.CRITERION_APOLICES, listaApolices);
                enviaApolices = true;
            }
            
            if (enviaApolices == true){
                mensagem = ServiceLocator.getMensagemService().readById(id);
                List<Apolice> apolices = ServiceLocator.getApoliceService().readByCriteria(criteria);

                for (int i = 0; i < apolices.size(); i++) {
                    MensagemApolice msgApolice = new MensagemApolice();
                    msgApolice.setMensagem(mensagem);
                    msgApolice.setApolice(apolices.get(i));
                    ServiceLocator.getMensagemApoliceService().create(msgApolice);
                }
                return "MSGAPOLICE";
            }else{
                return "MENSAGEM";
            }
        } catch (Exception ex){
            ex.printStackTrace();
            return ERROR;
        }
    }     
}
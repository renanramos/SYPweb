package sypweb.controller.action.mensagem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mentawai.core.BaseAction;
import sypseguradora.model.dao.ApoliceDAO;
import sypseguradora.model.pojo.Apolice;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Mensagem;
import sypweb.model.pojo.Usuario;

public class MensagemAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        try{
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            Map<String, Object> criteria = new HashMap<String, Object>();
            String listaApolice = new String();
            Long id = input.getLong("id");

            if (usuariologado.getTipo().equals("administrador")) {
                criteria.put(ApoliceDAO.CRITERION_ALL, "");
            } else {
                criteria.put(ApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());
            }
            List<Apolice> apolices = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);
            for (int i = 0; i < apolices.size(); i++) {
                listaApolice += apolices.get(i).getUsuario().getNome()+ " ("+apolices.get(i).getApolice() +");";
            }
            Mensagem mensagem = ServiceLocator.getMensagemService().readById(id);
            output.setValue("descricao", mensagem.getDescricao());
            output.setValue("listaApolice", listaApolice);
            return SUCCESS;
        }catch (Exception ex){
            return ERROR;
        }
    }
}
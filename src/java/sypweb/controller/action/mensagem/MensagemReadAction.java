package sypweb.controller.action.mensagem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.MensagemDAO;
import sypweb.model.pojo.Mensagem;
import sypweb.model.pojo.Usuario;

public class MensagemReadAction extends BaseAction {

    @Override
    public String execute() throws Exception {        
        try{
            String user;
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            List<Mensagem> mensagem = new ArrayList<Mensagem>();
            Map<String, Object> criteria = new HashMap<String, Object>();

            String desc = input.getString("busca");
            if (desc != null && !desc.isEmpty()) {
                criteria.put(MensagemDAO.CRITERION_DESC_I_LIKE, desc);
            }

            if (usuariologado.getTipo().equals("administrador")) {                 
                user = "admin";
            } else {            
                user = "corretor";
            }            
            criteria.put(MensagemDAO.CRITERION_USUARIO, usuariologado.getId());
            mensagem = ServiceLocator.getMensagemService().readByCriteria(criteria);
            
            String msgEnviadas = new String();
            for (int i=0; i <mensagem.size(); i++){
                if (mensagem.get(i).getEnviada() > 0){
                    msgEnviadas += mensagem.get(i).getId()+";";
                }
            }
            
            if (!mensagem.isEmpty()){
                output.setValue("valMag", msgEnviadas);
                output.setValue("lista", mensagem);
                output.setValue("user", user);
            }
            return SUCCESS;
        }catch(Exception ex){
            ex.printStackTrace();
            return ERROR;
        }
    }
}

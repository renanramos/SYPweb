package sypweb.controller.action.msgapolice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.MensagemApoliceDAO;
import sypweb.model.pojo.MensagemApolice;
import sypweb.model.pojo.Usuario;

public class MsgApoliceReadAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        try{
            String user;
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            Map<String, Object> criteria = new HashMap<String, Object>();
 
            if (usuariologado.getTipo().equals("administrador")) {
                criteria.put(MensagemApoliceDAO.CRITERION_ALL, "");     //pega todos os dados tabela de apolices
                user = "admin";
            } else {
                criteria.put(MensagemApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());
                user = "corretor";
            }

            List<MensagemApolice> msgApolice = ServiceLocator.getMensagemApoliceService().readByCriteria(criteria);
            MensagemApolice m = new MensagemApolice();
            for(int i =0;i<msgApolice.size();i++){
                m = msgApolice.get(i);
                System.out.println(m.getApolice());
                System.out.println(m.getDataHoraColeta());
                System.out.println(m.getMensagem());
                System.out.println("");                
            }
            
            output.setValue("lista", msgApolice);
            output.setValue("user", user);
            return SUCCESS;
        } catch (Exception ex){
            ex.printStackTrace();
            return ERROR;
        }
    }
}

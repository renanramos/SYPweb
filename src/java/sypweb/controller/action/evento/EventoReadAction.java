package sypweb.controller.action.evento;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypseguradora.model.dao.ApoliceDAO;
import sypseguradora.model.pojo.Apolice;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.EventoDAO;
import sypweb.model.pojo.Evento;
import sypweb.model.pojo.Usuario;

public class EventoReadAction extends BaseAction{

    @Override
    public String execute() throws Exception {
        try{
            String user;
            Map<String, Object> criteria = new HashMap<String, Object>();        
            List<Long> idApolices = new ArrayList<Long>();
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            String desc = input.getString("busca");
            if (desc != null && !desc.isEmpty()) {
                criteria.put(EventoDAO.CRITERION_APOLICE_I_LIKE, desc);
            }

            if (usuariologado.getTipo().equals("administrador")){
                criteria.put(EventoDAO.CRITERION_ALL, "");
                user = "admin";
            }
            else{
                criteria.put(ApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());  
                List<Apolice> apolices = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);               
                for (int i=0; i<apolices.size();i++){
                    idApolices.add(apolices.get(i).getId());
                }            
                criteria.clear();   //limpa criterios anteriores
                criteria.put(EventoDAO.CRITERION_APOLICES, idApolices);
                user = "corretor";
            }

            List<Evento> evento = ServiceLocator.getEventoService().readByCriteria(criteria);

            output.setValue("lista", evento);
            output.setValue("user", user);
            return SUCCESS;
        }catch (Exception ex){
            return ERROR;
        }
    }    
}

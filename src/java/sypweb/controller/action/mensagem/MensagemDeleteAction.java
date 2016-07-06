package sypweb.controller.action.mensagem;

import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;

public class MensagemDeleteAction extends BaseAction {
    
    @Override
    public String execute() throws Exception {
        try{
            Long id = input.getLong("id");
            ServiceLocator.getMensagemService().delete(id);
            return SUCCESS;
        }catch(Exception ex){
            return ERROR;
        }
    }
}

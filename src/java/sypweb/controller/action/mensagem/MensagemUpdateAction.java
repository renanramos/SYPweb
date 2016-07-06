package sypweb.controller.action.mensagem;

import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Mensagem;

public class MensagemUpdateAction extends BaseAction{
        @Override
    public String execute() throws Exception {
        try{
            Long id = input.getLong("id");
            String desc = input.getString("descricao");
            Mensagem mensagem = new Mensagem();//input.getObject(Mensagem.class, "mensagem");
            mensagem.setId(id);
            mensagem.setDescricao(desc);            
            ServiceLocator.getMensagemService().update(mensagem);
            return SUCCESS;  
        }catch(Exception ex){
            return ERROR;
        }          
    }
}

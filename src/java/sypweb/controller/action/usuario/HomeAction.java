package sypweb.controller.action.usuario;

import org.mentawai.core.BaseAction;
import sypweb.model.pojo.Usuario;

public class HomeAction extends BaseAction{

    @Override
    public String execute() throws Exception {
        String consequence = SUCCESS;
        Usuario usuarioLogado = getUserSession();
        if(usuarioLogado == null){
            consequence = ERROR;
        }        
        return consequence;
    }
    
}
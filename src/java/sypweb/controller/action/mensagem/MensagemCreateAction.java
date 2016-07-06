package sypweb.controller.action.mensagem;

import java.util.Date;
import static org.mentawai.core.Action.ERROR;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Mensagem;
import sypweb.model.pojo.Usuario;

public class MensagemCreateAction extends BaseAction{

    @Override
    public String execute() throws Exception {
        try{
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            Mensagem mensagem = new Mensagem();
            mensagem.setDescricao(input.getString("descricao"));
            mensagem.setUsuario(usuariologado);
            try{
                ServiceLocator.getMensagemService().create(mensagem);                
                return SUCCESS;        
            }catch(Exception e){
                return ERROR;
            }
        }catch (Exception ex){
            return ERROR;
        }
    }
}

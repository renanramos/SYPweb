package sypweb.controller.action.usuario;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Usuario;

public class LoginAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        String consequence = ERROR;
        String usuario = input.getString("usuario");
        String senha = input.getString("senha");
        
        Map<String, Object> error = new HashMap();
        
        if (senha != null && !usuario.equals("administrador")) {
            senha = ServiceLocator.getUsuarioService().encode(senha);
        }

        Usuario usuarioLogado = ServiceLocator.getUsuarioService().login(usuario, senha);

        if (usuarioLogado != null) {
            setUserSession(usuarioLogado);
            setSessionObj(usuarioLogado);
            session.setAttribute("usuarioLogado", usuarioLogado);
            if (usuarioLogado.getStatus()) {
                String grupo = usuarioLogado.getTipo().toString();
                setSessionGroup(grupo);
                session.setAttribute("usuarioLogado", usuarioLogado);
                session.setAttribute("grupo", grupo);
                output.setValue("usuarioLogado", usuarioLogado);
                registraData(usuarioLogado);
                consequence = grupo;
            } else {
                consequence = "redireciona";
            }
        }
         error.put("error", "Usuário ou senha inválidos!");
         output.setValue("error", error);
        //fim se usuarioLogado 

        return "administrador";//consequence;
    }
    
    public void registraData(Usuario usuario) {
        Date hoje = new Date(); 
        SimpleDateFormat df; 
        df = new SimpleDateFormat("dd/MM/yyyy"); 
        
        usuario.setPermissao(df.format(hoje));
        try{
            ServiceLocator.getUsuarioService().update(usuario);
        }catch(Exception ex){
            output.setValue("error", "Exceção ocorrida!");
        }
    }
    
}

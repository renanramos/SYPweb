package sypweb.controller.action.usuario;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mentawai.core.*;
import static org.mentawai.core.Action.ERROR;
import org.mentawai.filter.AuthenticationFree;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.UsuarioDAO;
import sypweb.model.integracao.GeraSenha;
import sypweb.model.pojo.Usuario;

public class RecuperarSenhaAction extends BaseAction implements AuthenticationFree {

    @Override
    public String execute() throws Exception {

        String consequence = ERROR;
        if (isGet()) {
            consequence = doGet();
        } else {
            if (isPost()) {
                consequence = doPost();
            }
        }
        return consequence;
    }

    private String doGet() {
        return "FORM";
    }

    private String doPost() throws Exception {

        String consequence = ERROR;

        String emailNovo = input.getString("email");

        Map<String, Object> error = new HashMap();
        Map<String, Object> envio = new HashMap();
        Map<String, Object> criteria = new HashMap<String, Object>();
        GeraSenha senha = new GeraSenha();
        if (!emailNovo.isEmpty()) {
            criteria.put(UsuarioDAO.CRITERION_EMAIL_I_LIKE, emailNovo);
            List<Usuario> usuarios = ServiceLocator.getUsuarioService().readByCriteria(criteria);
            if (usuarios.size() == 1) {
                Usuario usuario = usuarios.get(0);
                usuario.setStatus(false);
                usuario.setSenha(senha.getSenha());
                ServiceLocator.getUsuarioService().enviarEmail(usuario);

                if (!usuario.getPermissao().equals("administrador")) {
                    usuario.setSenha(ServiceLocator.getUsuarioService().encode(usuario.getSenha()));
                }

                ServiceLocator.getUsuarioService().update(usuario);
                error.put("envio", "Senha encaminhada para o seu email!");
                output.setValue("envio", envio);
                consequence = SUCCESS;
            } else {
                error.put("error", "Email inválido <br><br> Não foi possível recuperar a senha. Fale com o administrador.");
                output.setValue("error", error);
                consequence = ERROR;
            }
        }else{
            error.put("error", "Email inválido");
            output.setValue("error", error);
            consequence = ERROR;
        }    
        return consequence;
    }

    @Override
    public boolean bypassAuthentication(String string) {
        return true;
    }
}

package sypweb.controller.action.usuario;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.ERROR;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import org.mentawai.filter.AuthenticationFree;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.UsuarioDAO;
import sypweb.model.pojo.Usuario;

public class RedefinirSenhaAction extends BaseAction implements AuthenticationFree {

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

    @Override
    public boolean bypassAuthentication(String string) {
        return true;
    }

    private String doGet() throws Exception {
        String consequence = "LOGOUT";
        String email = input.getString("email");
        String token = input.getString("token");
        Map<String, Object> criteria = new HashMap<String, Object>();
        criteria.put(UsuarioDAO.CRITERION_EMAIL_I_LIKE, email);
        List<Usuario> usuarios =
                ServiceLocator.getUsuarioService().readByCriteria(criteria);
        if (usuarios.size() == 1) {
            Usuario usuario = usuarios.get(0);
            if (usuario.getEmail().equals(email)) {
                String contraToken =
                        ServiceLocator.getUsuarioService().encode(usuario.getSenha());
                System.out.println("TOKEN :" + contraToken);
                if (contraToken.equals(token)) {
                    session.setAttribute("usuario", usuario);
                    consequence = "FORM";
                }
            }
        }
        return consequence;
    }

    private String doPost() throws Exception {
        String consequence = ERROR;
        String nova = input.getString("senhaTeste");
        
        if (nova != null) {
            nova = ServiceLocator.getUsuarioService().encode(nova);
        }
        String confirmacao = input.getString("confirmacao");
        if (confirmacao != null) {
            confirmacao = ServiceLocator.getUsuarioService().encode(confirmacao);
        }
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        
        if (!nova.isEmpty() && nova.equals(confirmacao)) {
            usuario.setSenha(nova);
            usuario.setStatus(true);
            ServiceLocator.getUsuarioService().update(usuario);
            output.setValue("ok", "Senha alterada com sucesso!");
            consequence = SUCCESS;
        } else {
            output.setValue("error", "Senhas não conferem ou não obedecem o padrão!");
        }
        return consequence;
    }
}
package sypweb.controller.action.usuario;

import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Usuario;

public class PerfilAction extends BaseAction{

   @Override
   public String execute() throws Exception {
       Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");       
       sypseguradora.model.pojo.Usuario usuario = sypseguradora.model.ServiceLocator.getUsuarioService().readById(usuariologado.getId());
       Usuario usuarioSyp = ServiceLocator.getUsuarioService().readById(usuariologado.getId());
       output.setValue("usuarioSyp", usuarioSyp);       
       output.setValue("usuario", usuario);       
       return SUCCESS;
   }
   
}
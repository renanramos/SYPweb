package sypweb.controller;

import org.mentawai.action.LogoutAction;
import org.mentawai.authorization.AuthorizationManager;
import org.mentawai.authorization.Group;
import org.mentawai.authorization.Permission;
import org.mentawai.core.ActionConfig;
import org.mentawai.core.ApplicationManager;
import static org.mentawai.core.ApplicationManager.ERROR;
import static org.mentawai.core.ApplicationManager.SUCCESS;
import org.mentawai.core.Context;
import org.mentawai.core.Forward;
import org.mentawai.core.Redirect;
import org.mentawai.filter.AuthorizationFilter;
import org.mentawai.mail.Email;
import sypweb.controller.action.Action;
import sypweb.controller.action.apolice.ApoliceReadAction;
import sypweb.controller.action.evento.EventoReadAction;
import sypweb.controller.action.evento.mapa.MapaAction;
import sypweb.controller.action.inicio.GraficoAction;
import sypweb.controller.action.mensagem.MensagemAction;
import sypweb.controller.action.mensagem.MensagemCreateAction;
import sypweb.controller.action.mensagem.MensagemDeleteAction;
import sypweb.controller.action.mensagem.MensagemReadAction;
import sypweb.controller.action.mensagem.MensagemShowFormAction;
import sypweb.controller.action.mensagem.MensagemUpdateAction;
import sypweb.controller.action.msgapolice.MsgApoliceCreateAction;
import sypweb.controller.action.msgapolice.MsgApoliceReadAction;
import sypweb.controller.action.usuario.LoginAction;
import sypweb.controller.action.usuario.PerfilAction;
import sypweb.controller.action.usuario.RecuperarSenhaAction;
import sypweb.controller.action.usuario.RedefinirSenhaAction;

public class AppManager extends ApplicationManager {

    @Override
    public void init(Context application) {
        
        Group corretor = new Group("corretor");
        corretor.addPermission("Eventos").addPermission("RecuperarSenha").addPermission("RedefinirSenha");
        corretor.addPermission("Mensagem").addPermission("MensagemRead").addPermission("MensagemCreate").addPermission("MensagemUpdate").addPermission("MensagemDelete");
        corretor.addPermission("Mapa");
        corretor.addPermission("PerfilRead");
        AuthorizationManager.addGroup(corretor);
        //
        Group seguradopf = new Group("seguradopf");
        seguradopf.addPermission("Mensagem").addPermission("RecuperarSenha");
        AuthorizationManager.addGroup(seguradopf);
        //
        Group seguradopj = new Group("seguradopj");
        seguradopj.addPermission("Mensagem").addPermission("RecuperarSenha");
        AuthorizationManager.addGroup(seguradopj);
        //
        Group administrador = new Group("administrador");
        administrador.addPermission("Eventos").addPermission("Home");
        administrador.addPermission("Mensagem").addPermission("MensagemShowForm").addPermission("MensagemRead").addPermission("MensagemCreate").addPermission("MensagemDelete").addPermission("MensagemUpdate");
        administrador.addPermission("MsgApolice").addPermission("MsgApoliceRead").addPermission("MsgApoliceCreate");
        administrador.addPermission("Mapa").addPermission("RecuperarSenha");
        administrador.addPermission("ApoliceRead").addPermission("PerfilRead").addPermission("ApoliceReadId");
        AuthorizationManager.addGroup(administrador);
        // E-mail
        Email.setSendEmail(true);
        Email.setDefaultHostName("smtp.gmail.com");
        Email.setDefaultPort(465);
        Email.setDefaultSslConnection(true);
        Email.setDefaultAuthentication("administrador", "si2014syp");
        Email.setDefaultFrom("administracao@sypseguros.com", "SYP-Seguros");
    }

    @Override
    public void loadActions() {
        ActionConfig ac = null;

        this.addGlobalConsequence(ACCESSDENIED, new Redirect("Logout.mtw"));

        //login
        ac = new ActionConfig("Login", LoginAction.class);
        ac.addConsequence("corretor", new Redirect("Home.mtw"));
        ac.addConsequence("seguradopf", new Redirect("Home.mtw"));
        ac.addConsequence("seguradopj", new Redirect("Home.mtw"));
        ac.addConsequence("administrador", new Redirect("Home.mtw"));
        ac.addConsequence("redireciona", new Forward("jsp/usuario/redefinirSenha.page"));
        ac.addConsequence(ERROR, new Forward("index.jsp"));
        this.add(ac);

        //lougout
        ac = new ActionConfig("Logout", LogoutAction.class);
        ac.addConsequence(SUCCESS, new Redirect("/"));
        this.add(ac);

        //Recuperar Senha
        ac = new ActionConfig("RecuperarSenha", RecuperarSenhaAction.class);
        ac.addConsequence(SUCCESS, new Redirect("Login.mtw"));
        ac.addConsequence(ERROR, new Forward("jsp/usuario/recuperaSenha.jsp"));
        ac.addConsequence("FORM", new Forward("jsp/usuario/recuperaSenha.page"));        
        this.add(ac);

        //Redefinir senha
        ac = new ActionConfig("RedefinirSenha", RedefinirSenhaAction.class);
        ac.addConsequence("LOGOUT", new Redirect("Logout.mtw"));
        ac.addConsequence("FORM", new Forward("jsp/usuario/redefinirSenha.page"));
        ac.addConsequence(SUCCESS, new Redirect("Logout.mtw"));
        ac.addConsequence(ERROR, new Forward("jsp/usuario/redefinirSenha.page"));
        this.add(ac);
        
        //Redefinir senha logado
        ac = new ActionConfig("AlterarSenha", Action.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/usuario/redefinirSenha.page"));
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));
        this.add(ac);
        
        //Home
        ac = new ActionConfig("Home", GraficoAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/inicio/formRead.page"));
        ac.addConsequence(ERROR, new Redirect("Logout.mtw"));
        this.add(ac);

        //Eventos
        ac = new ActionConfig("Eventos", EventoReadAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/evento/list.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("Eventos")));
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));
        this.add(ac);

        //Mapa
        ac = new ActionConfig("Mapa", MapaAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/evento/mapa/mapa.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("Mapa")));        
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));        
        this.add(ac);

        //Mensagem
        ac = new ActionConfig("Mensagem", Action.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/mensagem/formCreate.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("Mensagem")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        ac = new ActionConfig("MensagemShowForm", MensagemShowFormAction.class);
        ac.addConsequence("CREATE", new Forward("jsp/mensagem/formCreate.page"));
        ac.addConsequence("UPDATE", new Forward("jsp/mensagem/formUpdate.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("MensagemShowForm")));
        this.add(ac);
        
        ac = new ActionConfig("MensagemCreate", MensagemCreateAction.class);
        ac.addConsequence(SUCCESS, new Redirect("MensagemRead.mtw"));
        ac.addFilter(new AuthorizationFilter(new Permission("MensagemCreate")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        ac = new ActionConfig("MensagemRead", MensagemReadAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/mensagem/list.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("MensagemRead")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);
        
        ac = new ActionConfig("MensagemUpdate", MensagemUpdateAction.class);
        ac.addConsequence(SUCCESS, new Redirect("MensagemRead.mtw"));
        ac.addFilter(new AuthorizationFilter(new Permission("MensagemUpdate")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        ac = new ActionConfig("MensagemDelete", MensagemDeleteAction.class);
        ac.addConsequence(SUCCESS, new Redirect("MensagemRead.mtw"));
        ac.addFilter(new AuthorizationFilter(new Permission("MensagemDelete")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        //Mensagem Apolice
        ac = new ActionConfig("MsgApoliceRead", MsgApoliceReadAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/mensagemApolice/list.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("MsgApoliceRead")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        ac = new ActionConfig("MsgApolice", MensagemAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/mensagemApolice/formCreate.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("MsgApolice")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        ac = new ActionConfig("MsgApoliceCreate", MsgApoliceCreateAction.class);        
        ac.addConsequence("MSGAPOLICE", new Redirect("MsgApoliceRead.mtw"));
        ac.addConsequence("MENSAGEM", new Redirect("MensagemRead.mtw"));
        ac.addFilter(new AuthorizationFilter(new Permission("MsgApoliceCreate")));
        ac.addConsequence(ERROR, new Forward("/"));
        this.add(ac);

        //Apolice
        ac = new ActionConfig("ApoliceRead", ApoliceReadAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/apolice/list.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("ApoliceRead")));
        ac.addConsequence(ACCESSDENIED, new Redirect("Home.mtw"));
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));
        this.add(ac);

        ac = new ActionConfig("ApoliceReadId", ApoliceReadAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/apolice/formRead.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("ApoliceReadId")));
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));
        this.add(ac);

        ac = new ActionConfig("PerfilRead", PerfilAction.class);
        ac.addConsequence(SUCCESS, new Forward("jsp/perfil/formRead.page"));
        ac.addFilter(new AuthorizationFilter(new Permission("PerfilRead")));        
        ac.addConsequence(ERROR, new Redirect("Home.mtw"));
        this.add(ac);
    }
}

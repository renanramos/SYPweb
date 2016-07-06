package sypweb.controller.action.mensagem;

import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Mensagem;

public class MensagemReadIdAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        String consequence = SUCCESS;

        Long id = input.getLong("id");

        Mensagem mensagem = new Mensagem();
        ServiceLocator.getMensagemApoliceService().readById(id);
        
        output.setValue("mensagem", mensagem);

        return consequence;
    }
}

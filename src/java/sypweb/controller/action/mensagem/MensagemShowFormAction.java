package sypweb.controller.action.mensagem;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.mentawai.core.BaseAction;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Mensagem;

public class MensagemShowFormAction extends BaseAction{

    @Override
    public String execute() throws Exception {
        String consequence = "CREATE";
        Long id = input.getLong("id");
        if (id != null && id > 0) {
            Mensagem mensagem = ServiceLocator.getMensagemService().readById(id);
            output.setValue("mensagem", mensagem);
            consequence = "UPDATE";
        }
        return consequence;
    }
}

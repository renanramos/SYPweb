package sypweb.controller.action;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypseguradora.model.ServiceLocator;
import sypseguradora.model.pojo.Corretor;
import sypweb.model.pojo.TipoEvento;

public class Action extends BaseAction {

    @Override
    public String execute() throws Exception {
        this.preload();
        return SUCCESS;
    }

    private void preload() throws Exception {
        Map<String, Object> criteria = new HashMap<String, Object>();
        List<Corretor> corretores = ServiceLocator.getCorretorService().readByCriteria(criteria);
        Map<Long, String> corretorOptions = new LinkedHashMap<Long, String>();
        for (Corretor corretor : corretores) {
            corretorOptions.put(corretor.getCnpj(), corretor.getUsuario().getNome());
        }
        output.setValue("corretorOptions", corretorOptions);
        
        Map<String, Object> criteriaEvento = new HashMap<String, Object>();
        List<TipoEvento> tipoEventos = sypweb.model.ServiceLocator.getTipoEventoService().readByCriteria(criteriaEvento);
        Map<Long, String> tipoEventoOptions = new LinkedHashMap<Long, String>();
        for(TipoEvento tipoEvento : tipoEventos){
            tipoEventoOptions.put(tipoEvento.getId(), tipoEvento.getNome());
        }
        output.setValue("tipoEventoOptions", tipoEventoOptions);
    }
}

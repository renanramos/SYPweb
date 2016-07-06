package sypweb.controller.action.evento.mapa;

import java.text.SimpleDateFormat;
import static org.mentawai.core.Action.ERROR;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypseguradora.model.pojo.Apolice;
import sypweb.model.ServiceLocator;
import sypweb.model.pojo.Evento;

public class MapaAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        try {
            String consequence = SUCCESS;
            Long id = input.getLong("id");
            Evento evento = ServiceLocator.getEventoService().readById(id);
            output.setValue("evento", evento);

            if ((evento.getApolice().getId() != null) && (evento.getApolice().getId() > 0)) {
                Apolice apolice = new Apolice();
                apolice = sypseguradora.model.ServiceLocator.getApoliceService().readById(evento.getApolice().getId());
                if (apolice != null) {
                    SimpleDateFormat ano = new SimpleDateFormat("yyyy");
                    //Ano fabricacao e modelo do veículo
                    Object ano_fabricacao = ano.format(apolice.getVeiculo().getAno_fabricacao());
                    Object ano_modelo = ano.format(apolice.getVeiculo().getAno_modelo());
                    output.setValue("ano_fabricacao", ano_fabricacao);
                    output.setValue("ano_modelo", ano_modelo);
                    //data do evento
//                    SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
//                    Object data_cadastro = data.format(evento.getDataHoraCadastro());
//
                    if (apolice.getSegurado_pf().getData_nascimento() != null) {
                        SimpleDateFormat dataNascimento = new SimpleDateFormat("MM/dd/yyyy");
                        Object data_nascimento = dataNascimento.format(apolice.getSegurado_pf().getData_nascimento());
                        output.setValue("data_nascimento", data_nascimento);
                    }
//
//                    output.setValue("data_cadastro", data_cadastro);
                    output.setValue("apolice", apolice);
                } else {
                    consequence = ERROR;
                }
            } else {
                consequence = ERROR;
            }
            return consequence;
        } catch (Exception ex) {
            return ERROR;
        }
    }
}

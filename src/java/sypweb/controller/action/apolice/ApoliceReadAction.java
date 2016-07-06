package sypweb.controller.action.apolice;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.mentawai.core.Action.SUCCESS;
import org.mentawai.core.BaseAction;
import sypseguradora.model.dao.ApoliceDAO;
import sypseguradora.model.pojo.Apolice;
import sypweb.model.pojo.Usuario;

public class ApoliceReadAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        try {
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            Map<String, Object> criteria = new HashMap<String, Object>();
            String apolice = input.getString("apolice");
            Long id = input.getLong("id");
            String desc = input.getString("busca");
            if (desc != null && !desc.isEmpty()) {
                try {
                    criteria.put(ApoliceDAO.CRITERION_SEGURADOPF, Long.parseLong(desc));
                    criteria.put(ApoliceDAO.CRITERION_SEGURADOPJ, Long.parseLong(desc));
                } catch (Exception ex) {
                    criteria.put(ApoliceDAO.CRITERION_APOLICE_I_LIKE, desc);           
                }
            }

            if (apolice == null || apolice.isEmpty()) {
                String user;

                if (usuariologado.getTipo().equals("administrador")) {
                    criteria.put(ApoliceDAO.CRITERION_ALL, "");     //pega todos os dados tabela de apolices
                    user = "admin";
                } else {
                    criteria.put(ApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());  
                    user = "corretor";
                }

                List<Apolice> apolices = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);
                output.setValue("lista", apolices);
                output.setValue("user", user);
            } else {
                criteria.put(ApoliceDAO.CRITERION_APOLICE_I_LIKE, apolice);
                List<Apolice> apoliceId = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);

                if (apoliceId.get(0).getSegurado_pf().getData_nascimento() == null) {
//                                                            
                    SimpleDateFormat ano = new SimpleDateFormat("yyyy");
                    //Ano fabricacao e modelo do veículo
                    Object ano_fabricacao = ano.format(apoliceId.get(0).getVeiculo().getAno_fabricacao());
                    Object ano_modelo = ano.format(apoliceId.get(0).getVeiculo().getAno_modelo());
                    output.setValue("ano_fabricacao", ano_fabricacao);
                    output.setValue("ano_modelo", ano_modelo);
                }else{
//               
//                //data de nascimento
                SimpleDateFormat data = new SimpleDateFormat("MM/dd/yyyy");
                Object data_nascimento = data.format(apoliceId.get(0).getSegurado_pf().getData_nascimento());
                output.setValue("data_nascimento", data_nascimento);

                SimpleDateFormat ano = new SimpleDateFormat("yyyy");
                //Ano fabricacao e modelo do veículo
                Object ano_fabricacao = ano.format(apoliceId.get(0).getVeiculo().getAno_fabricacao());
                Object ano_modelo = ano.format(apoliceId.get(0).getVeiculo().getAno_modelo());
                output.setValue("ano_fabricacao", ano_fabricacao);
                output.setValue("ano_modelo", ano_modelo);
                }
                output.setValue("apoliceId", apoliceId.get(0));
            }
            return SUCCESS;
        } catch (Exception ex) {
            return ERROR;
        }
    }
}

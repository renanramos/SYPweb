package sypweb.controller.action.inicio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mentawai.core.BaseAction;
import sypseguradora.model.dao.ApoliceDAO;
import sypseguradora.model.pojo.Apolice;
import sypweb.model.ServiceLocator;
import sypweb.model.dao.EventoDAO;
import sypweb.model.dao.TipoEventoDAO;
import sypweb.model.pojo.TipoEvento;
import sypweb.model.pojo.Usuario;

public class GraficoAction extends BaseAction {

    Map<String, Object> criteria = new HashMap<String, Object>();
    List<Long> idApolices = new ArrayList<Long>();

    @Override
    public String execute() throws Exception {

        String dataIni = input.getString("dataIni");
        String dataFim = input.getString("dataFim");
        String dataInicio = dataIni;
        String dataFinal  = dataFim;
        try {
            Usuario usuariologado = (Usuario) session.getAttribute("usuarioLogado");
            if (usuariologado.getTipo().equals("administrador")) {
                if (dataIni != null && dataFim != null) {                    
                    dataIni += " 00:00:01";       
                    dataFim += " 23:59:00";
                    criteria.put(EventoDAO.CRITERION_DATA_INI, dataIni);
                    criteria.put(EventoDAO.CRITERION_DATA_FIM, dataFim);
                } else {
                    criteria.put(EventoDAO.CRITERION_ALL, "");
                }
            } else {
                if (dataIni != null && dataFim != null) {
                    dataIni += " 00:00:01";       
                    dataFim += " 23:59:00";
                    criteria.put(EventoDAO.CRITERION_DATA_INI, dataIni);
                    criteria.put(EventoDAO.CRITERION_DATA_FIM, dataFim);
                }
                criteria.put(ApoliceDAO.CRITERION_CORRETOR, usuariologado.getRegSusep());
            }

            List<Apolice> apolices = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);
            for (int i = 0; i < apolices.size(); i++) {
                idApolices.add(apolices.get(i).getId());
            }

            CarregaDadosGrafico1(dataIni, dataFim);
            CarregaDadosGrafico2(dataIni, dataFim);
            CarregaDadosGrafico3(dataIni, dataFim);
                        
        if (dataInicio != null && dataFinal != null) {            
            output.setValue("dataIni", dataInicio);
            output.setValue("dataFim", dataFinal);            
        }
        
            return SUCCESS;
        } catch (Exception ex) {
            ex.printStackTrace();
            return ERROR;
        }
    }

    void CarregaDadosGrafico1(String dataIni, String dataFim) throws Exception {
        criteria.clear();   //limpa criterios anteriores
        criteria.put(TipoEventoDAO.CRITERION_APOLICES, idApolices);
        criteria.put(TipoEventoDAO.CRITERION_DATA_INI, dataIni);
        criteria.put(TipoEventoDAO.CRITERION_DATA_FIM, dataFim);

        List<TipoEvento> tipoEvento = ServiceLocator.getTipoEventoService().readByCriteria(criteria);

        for (int i = 0; i < tipoEvento.size(); i++) {
            System.out.println(tipoEvento.get(i));
        }

        for (int i = 0; i < tipoEvento.size(); i++) {
            output.setValue(tipoEvento.get(i).getNome(), tipoEvento.get(i).getQntOcorrido());
        }
    }

    void CarregaDadosGrafico2(String dataIni, String dataFim) throws Exception {
        String info = new String();
        String aviso = "";
        criteria.clear();   //limpa criterios anteriores
        criteria.put(sypweb.model.dao.ApoliceDAO.CRITERION_APOLICES, idApolices);
        criteria.put(sypweb.model.dao.ApoliceDAO.CRITERION_DATA_INI, dataIni);
        criteria.put(sypweb.model.dao.ApoliceDAO.CRITERION_DATA_FIM, dataFim);

        List<sypweb.model.pojo.Apolice> listaApolice = ServiceLocator.getApoliceService().readDadosGrafico2(criteria);

        for (int i = 0; i < listaApolice.size(); i++) {
            info += listaApolice.get(i).getApolice() + "," + listaApolice.get(i).getQntOcorrido() + ",";
        }

        output.setValue("apoliceOcorridos", info);
    }

    void CarregaDadosGrafico3(String dataIni, String dataFim) throws Exception {
        String info = new String();
        Map<String, Object> criterio = new HashMap();
        List<sypweb.model.pojo.Apolice> lista = new ArrayList();
        criterio.put(sypweb.model.dao.ApoliceDAO.CRITERION_ALL, "");
        lista = ServiceLocator.getApoliceService().readByCriteria(criterio);
        sypweb.model.pojo.Apolice a = new sypweb.model.pojo.Apolice();
        int registrados = 0;
        int nregistrados = 0;
        for (int i = 0; i < lista.size(); i++) {
            a = lista.get(i);
            if (a.getSypCodeStatus()) {
                registrados++;
            } else {
                nregistrados++;
            }
        }

        for (int i = 0; i < lista.size(); i++) {
            info += lista.get(i).getApolice();
            if (lista.get(i).getSypCodeStatus()) {
                info += ",1,";
            } else {
                info += ",0,";
            }
        }

        output.setValue("apolice", info);
        output.setValue("registrados", registrados);
        output.setValue("nregistrados", nregistrados);
    }
}

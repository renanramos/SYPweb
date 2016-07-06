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

public class FiltroGraficoAction extends BaseAction {

    Map<String, Object> criteria = new HashMap<String, Object>();
    List<Long> idApolices = new ArrayList<Long>();

    @Override
    public String execute() throws Exception {
        String consequence = SUCCESS;
        try {
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
            if (usuarioLogado.getTipo().equals("administrador")) {
                criteria.put(EventoDAO.CRITERION_ALL, "");
            } else {
                criteria.put(ApoliceDAO.CRITERION_CORRETOR, usuarioLogado.getRegSusep());
            }

            List<Apolice> apolices = sypseguradora.model.ServiceLocator.getApoliceService().readByCriteria(criteria);
            for (int i = 0; i < apolices.size(); i++) {
                idApolices.add(apolices.get(i).getId());
            }

            CarregaDadosGrafico1();
            CarregaDadosGrafico2();
            CarregaDadosGrafico3();
        } catch (Exception ex) {
            consequence = ERROR;
        }
        return consequence; //To change body of generated methods, choose Tools | Templates.
    }
    
    void CarregaDadosGrafico1() throws Exception {
        criteria.clear();   //limpa criterios anteriores
        criteria.put(TipoEventoDAO.CRITERION_APOLICES, idApolices);

        List<TipoEvento> tipoEvento = ServiceLocator.getTipoEventoService().filtroByCriteria(criteria);
        for (int i = 0; i < tipoEvento.size(); i++) {
            output.setValue(tipoEvento.get(i).getNome(), tipoEvento.get(i).getQntOcorrido());
        }
    }

    void CarregaDadosGrafico2() throws Exception {
//        String info = new String();
//        criteria.clear();   //limpa criterios anteriores
//        criteria.put(sypweb.model.dao.ApoliceDAO.CRITERION_APOLICES, idApolices);
//
//        List<sypweb.model.pojo.Apolice> listaApolice = ServiceLocator.getApoliceService().readDadosGrafico2(criteria);
//
//        for (int i = 0; i < listaApolice.size(); i++) {
//            info += listaApolice.get(i).getApolice() + "," + listaApolice.get(i).getQntOcorrido() + ",";
//        }
//
//        output.setValue("apoliceOcorridos", info);

    }

    void CarregaDadosGrafico3() throws Exception {
//        String info = new String(); 
//        Map<String, Object> criterio = new HashMap();
//        List<sypweb.model.pojo.Apolice> lista = new ArrayList();
//        criterio.put(sypweb.model.dao.ApoliceDAO.CRITERION_ALL, "");
//        lista = ServiceLocator.getApoliceService().readByCriteria(criterio);
//        sypweb.model.pojo.Apolice a = new sypweb.model.pojo.Apolice();
//        int registrados = 0;
//        int nregistrados = 0;
//        for (int i = 0; i < lista.size(); i++) {
//            a = lista.get(i);
//            if (a.getSypCodeStatus()) {
//                registrados++;
//            } else {
//                nregistrados++;
//            }
//        }
//        
//        for(int i = 0;i < lista.size(); i++){
//            info += lista.get(i).getApolice();
//            if(lista.get(i).getSypCodeStatus()){
//                info += ",1,";
//            }else{
//                info += ",0,";
//            }
//        }
//        
//        output.setValue("apolice", info);
//        output.setValue("registrados", registrados);
//        output.setValue("nregistrados", nregistrados);
    }
}

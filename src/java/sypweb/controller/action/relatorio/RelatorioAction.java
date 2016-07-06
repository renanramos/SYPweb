package sypweb.controller.action.relatorio;

import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.mentawai.core.BaseAction;
import org.mentawai.core.StreamConsequence;
import sypweb.model.ConnectionManager;

public class RelatorioAction extends BaseAction {

    public String execute() throws Exception {
        String consequence = SUCCESS;
        String[] evento = input.getStrings("tipoEvento");

        Connection conn = ConnectionManager.getInstance().getConnection();

        String consulta = "select evento.id, tipoevento.nome, apolice.apolice, apolice.sypcode  from evento \n"
                + "left join tipoevento on evento.tipoevento_fk = tipoevento.id\n"
                + "left join apolice on apolice.id=evento.apolice_fk\n"
                + "where (1=1)";
        int i = 0;
        if (evento.length != 0) {
            if (evento.length >= 1) {
                consulta += " And ";
                while (i < evento.length) {
                    if (!evento[i].isEmpty()) {
                        consulta += " tipoevento.id = " + evento[i] + " ";
                        if (i != (evento.length - 1)) {
                            consulta += " or ";
                        }
                    }
                    i++;
                }
            }
        }
        Map parameters = new HashMap();
        parameters.put("consulta", consulta);
        InputStream report = RelatorioAction.class.getResourceAsStream("/sypweb/view/report/sypseguros.jasper");

        JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);
        byte[] pdf = JasperExportManager.exportReportToPdf(print);
        //Preparando para o stream do Mentawai
        output.setValue(StreamConsequence.STREAM, pdf);
        output.setValue(StreamConsequence.CONTENT_LENGTH, pdf.length);
        output.setValue(StreamConsequence.FILENAME, "relatorio_sypseguros.pdf");
        conn.close();
        return consequence;
    }
}

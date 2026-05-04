package controllers;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import configuration.jdbcConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/GeneratePackageReportPDF")
public class GeneratePackageReportPDF extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=PackageReport.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Paragraph title = new Paragraph("Package Report",
                    new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD));
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(8); // 8 columns
            table.setWidthPercentage(100);
            table.addCell("ID");
            table.addCell("Title");
            table.addCell("Price");
            table.addCell("Feature 1");
            table.addCell("Feature 2");
            table.addCell("Feature 3");
            table.addCell("Description");
            table.addCell("Assigned Employees");

            Connection con = jdbcConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM packages");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                table.addCell(String.valueOf(rs.getInt("id")));
                table.addCell(rs.getString("title"));
                table.addCell(String.valueOf(rs.getDouble("price")));
                table.addCell(rs.getString("feature1"));
                table.addCell(rs.getString("feature2"));
                table.addCell(rs.getString("feature3"));
                table.addCell(rs.getString("description"));
                table.addCell(String.valueOf(rs.getInt("assign_emp")));
            }

            document.add(table);
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

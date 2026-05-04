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

@WebServlet("/GenerateBookingReportPDF")
public class GenerateBookingReportPDF extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=BookingReport.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Paragraph title = new Paragraph("Booking Report",
                    new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD));
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(9); // 9 columns
            table.setWidthPercentage(100);
            table.addCell("Booking ID");
            table.addCell("User ID");
            table.addCell("Service Name");
            table.addCell("Booking Date");
            table.addCell("Booking Time");
            table.addCell("Address");
            table.addCell("Contact");
            table.addCell("Status");
            table.addCell("Price");

            Connection con = jdbcConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM user_booking");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                table.addCell(String.valueOf(rs.getInt("booking_id")));
                table.addCell(String.valueOf(rs.getInt("user_id")));
                table.addCell(rs.getString("service_name"));
                table.addCell(String.valueOf(rs.getDate("booking_date")));
                table.addCell(String.valueOf(rs.getTime("booking_time")));
                table.addCell(rs.getString("address"));
                table.addCell(rs.getString("contact_number"));
                table.addCell(rs.getString("status"));
                table.addCell(String.valueOf(rs.getInt("price")));
            }

            document.add(table);
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

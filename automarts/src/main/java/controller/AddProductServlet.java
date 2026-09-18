package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;

import database.ProductDAO;

/**
 * Servlet implementation class AddProductServlet
 */
@MultipartConfig
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Reading the inputs from the product
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		
		//get the upload directory
				String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
				
				// create the upload directory if it does not exit
				File uploadDir = new File(uploadPath);
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
					// Retrieve the parts from the request
					Collection<Part> parts = request.getParts();
					String fileName = null;

					for (Part part : parts) {

					    // Check if the part is a file
					    if (part.getSubmittedFileName() != null) {

					        // Get the file name
					        fileName = Paths.get(part.getSubmittedFileName())
					                        .getFileName()
					                        .toString();

					        String filePath = uploadPath + File.separator + fileName;
					        System.out.println("File path: " + filePath);

					        // Save the file to the upload directory
					        try (InputStream inputStream = part.getInputStream();
					             OutputStream outputStream =
					                 Files.newOutputStream(Paths.get(filePath))) {

					            byte[] buffer = new byte[1024];
					            int bytesRead;

					            while ((bytesRead = inputStream.read(buffer)) != -1) {
					                outputStream.write(buffer, 0, bytesRead);
					            }
					        }

					        System.out.println("File " + fileName + " uploaded successfully.");
					    }
					}
					Product product = new Product();
					product.setName(name);
					product.setDescription(description);
					product.setPrice(price);

					// Save the relative path in the database
					// (e.g., "uploads/filename.jpg")
					String relativeFilePath = "uploads/" + fileName;
					product.setImagePath(relativeFilePath);

					System.out.println("After: " + relativeFilePath);

					ProductDAO dao = new ProductDAO();
					int result = dao.addProduct(product);

					if (result > 0) {
					    System.out.println("Product is added successfully");
					    RequestDispatcher rd =request.getRequestDispatcher("view_products.jsp");
					    rd.forward(request,response);
					} else {
					    System.out.println("Product could not be added");
					}
					
				}
	}


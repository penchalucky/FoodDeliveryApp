package com.foodApp.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Map;
import java.util.Set;

import com.foodApp.Connect.Connect;
import com.foodApp.DaoImpl.Cart;
import com.foodApp.modules.CartItem;
import com.foodApp.modules.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/confirm")
public class ConfirmOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		LocalDate currentDate = LocalDate.now();
       	Date sqlDate = Date.valueOf(currentDate);

   		Connection con = Connect.getConnect();
		String paymentMode = request.getParameter("paymentMethod");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		int restaurantId = (int) session.getAttribute("restaurantId");
		int userId = user.getUserId();
        float totalAmount = (float) session.getAttribute("total");
        int status = 0;
        int orderId = 0;

        // Insert into ordertable (fixed: added 'status' column)
		String OrderTableQuery = "INSERT INTO ordertable(userId, restaurantId, paymentMode, totalAmount, orderDate, status) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			con.setAutoCommit(false);
			PreparedStatement statement = con.prepareStatement(OrderTableQuery);
			statement.setInt(1, userId);
			statement.setInt(2, restaurantId);
			statement.setString(3, paymentMode);
			statement.setFloat(4, totalAmount);
			statement.setDate(5, sqlDate);
			statement.setString(6, "Pending"); // fixed: added status value
		    int c = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Get orderId
		try {
			String query = "SELECT MAX(orderId) FROM ordertable";
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				orderId = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// Get cart items
		Cart cart = (Cart) session.getAttribute("cart");
		Map<Integer, CartItem> map = cart.getItems();
		Set<Map.Entry<Integer, CartItem>> set = map.entrySet();
		  
		for (Map.Entry<Integer, CartItem> cartMap : set) { 
			int quantity = cartMap.getValue().getQuantity();
			float subTotal = cartMap.getValue().getSubTotal();
			String menuName = cartMap.getValue().getMenuName();
			int menuId;

			// Get menuId from menu table
			String MenuIdQuery = "SELECT * FROM menu WHERE menuName=?";
			try {
				PreparedStatement statement = con.prepareStatement(MenuIdQuery);
				statement.setString(1, menuName);
				ResultSet rs = statement.executeQuery();
				if (rs.next()) {
					menuId = rs.getInt(1);

					// Insert into orderitem
					String OrderItemQuery = "INSERT INTO orderitem (orderId, menuId, quantity, subTotal) VALUES (?, ?, ?, ?)";
					PreparedStatement statement1 = con.prepareStatement(OrderItemQuery);
					statement1.setInt(1, orderId);
					statement1.setInt(2, menuId);
					statement1.setInt(3, quantity);
					statement1.setFloat(4, subTotal);
					int status2 = statement1.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		  
		// Insert into orderhistory
		String orderHistoryQuery = "INSERT INTO orderhistory(orderId, userId, totalAmount, orderDate) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement statement2 = con.prepareStatement(orderHistoryQuery);
			statement2.setInt(1, orderId);
			statement2.setInt(2, userId);
			statement2.setFloat(3, totalAmount);
			statement2.setDate(4, sqlDate);
			status = statement2.executeUpdate();

			System.out.println("All Set Success");
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (status != 0) {
			session.setAttribute("cart", null);
			response.sendRedirect("orderSuccess.jsp");
		} else {
			response.sendRedirect("orderFailed.jsp");
		}
	}
}

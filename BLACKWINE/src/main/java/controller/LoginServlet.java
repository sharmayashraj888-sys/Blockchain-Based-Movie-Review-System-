package controller;

import util.DBInit;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        DBInit.initialize();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        if (dao.validateUser(email, password)) {

            int userId = dao.getUserIdByEmail(email);
            String role = dao.getUserRole(email, password);

            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("role", role);   // 🔴 IMPORTANT
            session.setAttribute("email", email);

            if ("admin".equals(role)) {
                response.sendRedirect("jsp/adminDashboard.jsp");
            } else {
            	response.sendRedirect(request.getContextPath() + "/jsp/home.html?user=" + email);            }

        } else {
            response.getWriter().println("Invalid email or password");
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/participant/*")   // protects all pages inside /participant/
public class ParticipantFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null ||
                !((model.User) session.getAttribute("user")).getRole().equals("PARTICIPANT")) {

            request.getRequestDispatcher("/access-denied.jsp").forward(req, res);
            return;
        }

        chain.doFilter(req, res);
    }
}

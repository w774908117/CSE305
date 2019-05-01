<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="heading" value="Home"/>
<%@ include file="header_default.jsp" %>

<div class="container">
			<h2 style="text-align: center">Sign Up</h2>
			<%
				String email = (String)session.getAttribute("email");
				String role = (String)session.getAttribute("role");
				
				//redirect to home page if already logged in
				if(email != null) {
					if(role.equals("manager")) {
						response.sendRedirect("managerHome.jsp");
					}
					else if(role.equals("customerRepresentative")) {
						response.sendRedirect("customerRepresentativeHome.jsp");
					}
					else {
						response.sendRedirect("home.jsp");
					}
				}
				
				String status = request.getParameter("status");
				if(status != null) {
					if(status.equals("true")) { %>
                        <div class="alert alert-success" role="alert" style="text-align: center">
                            Sign up Success! Now you can Login!
                        </div>
					<%}
					else {%>
                        <div class="alert alert-danger" role="alert" style="text-align: center">
                            Fail to Sign Up! SSN or Email alreay exsit!
                        </div>
					<%}
				}
			%>
			<form action="signUp">
				<div class="form-group">
                    <label >Email address</label>
					<input type="email" class="form-control" name="username" placeholder="Email/UserName">
				</div>
				<div class="form-group">
                    <label >Password</label>
	            	<input type="password" class="form-control" name="password" placeholder="Password">
	        	</div>
				<div class="form-group">
                    <label >First Name</label>
					<input type="text" class="form-control" name="firstName" placeholder="First Name">
				</div>
				<div class="form-group">
                    <label >Last Name</label>
					<input type="text" class="form-control" name="lastName" placeholder="Last Name">
				</div>
				<div class="form-group">
                    <label >Address</label>
					<input type="text" class="form-control" name="address" placeholder="Address">
				</div>
                <div class="form-group">
                    <label >City</label>
                    <input type="text" class="form-control" name="city" placeholder="City">
                </div>
                <div class="form-group">
                    <label >State</label>
                    <input type="text" class="form-control" name="state" placeholder="State">
                </div>
                <div class="form-group">
                    <label >Zipcode</label>
                    <input type="number" class="form-control" name="zipcode" placeholder="ZipCode">
                </div>
                <div class="form-group">
                    <label >Phone Number</label>
                    <input type="number" class="form-control" name="phone" placeholder="Telephone">
                </div>
				<div class="form-group">
                    <label >Social Security Number</label>
					<input type="number" class="form-control" name="ssn" placeholder="XXX-XX-XXXX">
				</div>
				<div class="form-group">
                    <label >Role</label>
					<select class="form-control" name="role">
                        <option value="manager">Manager</option>
                        <option value="customerRepresentative">Customer Representative</option>
						<option value="customer">Customer</option>
					</select>
				</div>
                <div class="form-group" style="text-align: center">
                    <input type="submit" value="Join Now" class="btn btn-success"/>
                </div>

			</form>
		</div>
<%@ include file="footer.jsp" %>
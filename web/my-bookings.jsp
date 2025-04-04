<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Booking" %>
<%@ page import="model.Trip" %>
<%@ page import="model.Tour" %>
<%@ page import="model.User" %>
<%@ page import="model.City" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>
<%@ page import="java.util.Currency" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đơn đặt tour của tôi - TourNest</title>
        <style>
            @import url(https://fonts.googleapis.com/css2?family=Poppins&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Roboto&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200);
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 min-h-screen">
        <%
            // Get user from session
            User user = (User) session.getAttribute("user");
            
            // Get attributes from request
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            Map<Integer, Trip> tripsMap = (Map<Integer, Trip>) request.getAttribute("tripsMap");
            Map<Integer, Tour> toursMap = (Map<Integer, Tour>) request.getAttribute("toursMap");
            Map<Integer, City> departureCitiesMap = (Map<Integer, City>) request.getAttribute("departureCitiesMap");
            Map<Integer, City> destinationCitiesMap = (Map<Integer, City>) request.getAttribute("destinationCitiesMap");
            
            // Format currency
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            currencyFormatter.setCurrency(Currency.getInstance("VND"));
            DecimalFormatSymbols dfs = new DecimalFormatSymbols(new Locale("vi", "VN"));
            dfs.setCurrencySymbol("VNĐ");
            ((DecimalFormat) currencyFormatter).setDecimalFormatSymbols(dfs);
            
            // Format date
            SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");
            
            // Get current date
            Date currentDate = new Date();
        %>
        
        <!-- Include Header -->
        <jsp:include page="components/header.jsp" />
        
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
            <div class="bg-white shadow-md rounded-lg">
                <div class="p-4 sm:p-6">
                    <h1 class="text-2xl font-bold text-blue-700 text-center mb-6">ĐƠN ĐẶT TOUR CỦA TÔI</h1>
                    
                    <% if (bookings == null || bookings.isEmpty()) { %>
                        <!-- No bookings message -->
                        <div class="text-center py-12">
                            <div class="mx-auto w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center mb-4">
                                <i class="fas fa-calendar-xmark text-4xl text-gray-400"></i>
                            </div>
                            <h2 class="text-xl font-medium text-gray-900 mb-2">Bạn chưa có đơn đặt tour nào</h2>
                            <p class="text-gray-500 mb-6">Hãy khám phá các tour du lịch hấp dẫn và đặt ngay nhé!</p>
                            <a href="tour" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition inline-block">
                                <i class="fas fa-plane-departure mr-2"></i> Tìm tour ngay
                            </a>
                        </div>
                    <% } else { %>
                        <!-- List of bookings -->
                        <div class="grid grid-cols-1 gap-6 mb-6">
                            <% for (Booking booking : bookings) { 
                                Trip trip = tripsMap.get(booking.getId());
                                Tour tour = toursMap.get(booking.getId());
                                City departureCity = departureCitiesMap.get(booking.getId());
                                City destinationCity = destinationCitiesMap.get(booking.getId());
                                
                                if (trip != null && tour != null) {
                                    double adultPrice = booking.getAdultNumber() * tour.getPriceAdult();
                                    double childPrice = booking.getChildNumber() * tour.getPriceChildren();
                                    double totalPrice = adultPrice + childPrice;
                                    
                                    // Calculate days until departure
                                    long daysUntilDeparture = -1;
                                    boolean canCancel = false;
                                    boolean isEarlyCancel = false;
                                    
                                    if (trip.getDepartureDate() != null) {
                                        long diffInMillies = Math.abs(trip.getDepartureDate().getTime() - currentDate.getTime());
                                        daysUntilDeparture = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                                        
                                        // Can cancel if departure date is in the future
                                        canCancel = trip.getDepartureDate().after(currentDate) && 
                                                  booking.getStatus() != null && 
                                                  (booking.getStatus().equals("Đã thanh toán") || booking.getStatus().equals("Đã duyệt"));
                                        
                                        // Early cancel (>7 days before departure)
                                        isEarlyCancel = daysUntilDeparture > 7;
                                    }
                            %>
                                <div class="border border-gray-200 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition">
                                    <div class="flex flex-col md:flex-row">
                                        <!-- Tour Image -->
                                        <div class="md:w-1/4">
                                            <img src="<%= tour.getImg() %>" alt="<%= tour.getName() %>" 
                                                 class="w-full h-48 md:h-full object-cover">
                                        </div>
                                        
                                        <!-- Booking Details -->
                                        <div class="md:w-3/4 p-4">
                                            <div class="flex justify-between items-start mb-2">
                                                <h2 class="text-lg font-bold text-blue-700 truncate"><%= tour.getName() %></h2>
                                                <div class="flex items-center">
                                                    <!-- Booking Status Badge -->
                                                    <% String statusClass = "bg-gray-100 text-gray-800"; %>
                                                    <% if (booking.getStatus() != null) {
                                                        if (booking.getStatus().equals("Đã thanh toán")) { 
                                                            statusClass = "bg-blue-100 text-blue-800";
                                                        } else if (booking.getStatus().equals("Đã duyệt")) { 
                                                            statusClass = "bg-green-100 text-green-800";
                                                        } else if (booking.getStatus().equals("Đã hủy")) { 
                                                            statusClass = "bg-red-100 text-red-800";
                                                        } else if (booking.getStatus().equals("Đã hủy muộn")) { 
                                                            statusClass = "bg-orange-100 text-orange-800";
                                                        } else if (booking.getStatus().equals("Hoàn thành")) { 
                                                            statusClass = "bg-purple-100 text-purple-800";
                                                        }
                                                    } %>
                                                    
                                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium <%= statusClass %> mr-2">
                                                        <%= booking.getStatus() != null ? booking.getStatus() : "Chưa xác định" %>
                                                    </span>
                                                    
                                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                                        Mã đơn: #<%= booking.getId() %>
                                                    </span>
                                                </div>
                                            </div>
                                            
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                                                <div>
                                                    <div class="flex items-start mb-2">
                                                        <div class="w-8 text-gray-500 flex-shrink-0">
                                                            <i class="fas fa-plane-departure"></i>
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="text-sm text-gray-500">Điểm đến:</div>
                                                            <div class="font-medium">
                                                                <%= departureCity != null ? departureCity.getName() : "Chưa xác định" %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                    <div class="flex items-start mb-2">
                                                        <div class="w-8 text-gray-500 flex-shrink-0">
                                                            <i class="fas fa-calendar-day"></i>
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="text-sm text-gray-500">Ngày khởi hành:</div>
                                                            <div class="font-medium">
                                                                <% if (trip.getDepartureDate() != null) { %>
                                                                    <%= dateFormatter.format(trip.getDepartureDate()) %>, <%= timeFormatter.format(trip.getDepartureDate()) %>
                                                                <% } else { %>
                                                                    Chưa xác định
                                                                <% } %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="flex items-start mb-2">
                                                        <div class="w-8 text-gray-500 flex-shrink-0">
                                                            <i class="fas fa-users"></i>
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="text-sm text-gray-500">Số lượng:</div>
                                                            <div class="font-medium">
                                                                <%= booking.getAdultNumber() %> người lớn, <%= booking.getChildNumber() %> trẻ em
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div>
                                                    <div class="flex items-start mb-2">
                                                        <div class="w-8 text-gray-500 flex-shrink-0">
                                                            <i class="fas fa-calendar-check"></i>
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="text-sm text-gray-500">Ngày đặt tour:</div>
                                                            <div class="font-medium">
                                                                <% if (booking.getCreatedDate() != null) { %>
                                                                    <%= dateFormatter.format(booking.getCreatedDate()) %>
                                                                <% } else { %>
                                                                    Chưa xác định
                                                                <% } %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="flex items-start mb-2">
                                                        <div class="w-8 text-gray-500 flex-shrink-0">
                                                            <i class="fas fa-money-bill-wave"></i>
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="text-sm text-gray-500">Tổng tiền:</div>
                                                            <div class="font-bold text-red-600">
                                                                <%= currencyFormatter.format(totalPrice) %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Actions -->
                                            <div class="flex justify-end space-x-2 pt-2 border-t">
                                                <!-- View Booking Details Button (with eye icon) -->
                                                <button type="button" onclick="showBookingDetails(<%= booking.getId() %>)" 
                                                        class="inline-flex items-center px-4 py-2 text-sm font-medium text-blue-700 bg-blue-50 border border-blue-200 rounded-md hover:bg-blue-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                                    <i class="fas fa-eye mr-2"></i> Xem chi tiết
                                                </button>
                                                
                                                <% if (canCancel) { %>
                                                    <!-- Cancel Button - show if trip hasn't started yet -->
                                                    <button type="button"
                                                            data-booking-id="<%= booking.getId() %>"
                                                            data-cancel-type="<%= isEarlyCancel ? "early" : "late" %>"
                                                            onclick="showCancelConfirmation(this.getAttribute('data-booking-id'), this.getAttribute('data-cancel-type'))"
                                                            class="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-red-600 border border-transparent rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                                                        <i class="fas fa-times-circle mr-2"></i> Hủy tour
                                                    </button>
                                                <% } %>
                                                
                                                <!-- Book Another Tour Button -->
                                                <a href="tour" class="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 border border-transparent rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                                    <i class="fas fa-plus mr-2"></i> Đặt tour khác
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <% 
                                }
                              } 
                            %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
        
        <!-- Booking Details Modal -->
        <div id="bookingDetailsModal" class="hidden fixed inset-0 bg-gray-500 bg-opacity-75 flex items-center justify-center p-4 z-50">
            <div class="bg-white rounded-lg shadow-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-xl font-bold text-blue-700">Chi tiết đơn đặt tour</h2>
                        <button type="button" onclick="closeModal('bookingDetailsModal')" class="text-gray-400 hover:text-gray-500 focus:outline-none">
                            <i class="fas fa-times text-xl"></i>
                        </button>
                    </div>
                    
                    <div id="bookingDetailsContent">
                        <!-- Content will be loaded dynamically -->
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Cancel Confirmation Modal -->
        <div id="cancelConfirmationModal" class="hidden fixed inset-0 bg-gray-500 bg-opacity-75 flex items-center justify-center p-4 z-50">
            <div class="bg-white rounded-lg shadow-xl max-w-md w-full">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-xl font-bold text-red-600" id="cancelModalTitle">Xác nhận hủy tour</h2>
                        <button type="button" onclick="closeModal('cancelConfirmationModal')" class="text-gray-400 hover:text-gray-500 focus:outline-none">
                            <i class="fas fa-times text-xl"></i>
                        </button>
                    </div>
                    
                    <div id="earlyCancelWarning" class="mb-4 p-4 bg-yellow-50 text-yellow-700 rounded-lg hidden">
                        <div class="flex">
                            <div class="flex-shrink-0">
                                <i class="fas fa-exclamation-triangle text-yellow-400 mr-2"></i>
                            </div>
                            <div>
                                <p class="font-medium">Lưu ý:</p>
                                <p>Bạn đang hủy tour trước 7 ngày so với ngày khởi hành. Bạn sẽ được hoàn tiền theo chính sách của chúng tôi.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div id="lateCancelWarning" class="mb-4 p-4 bg-red-50 text-red-700 rounded-lg hidden">
                        <div class="flex">
                            <div class="flex-shrink-0">
                                <i class="fas fa-exclamation-triangle text-red-400 mr-2"></i>
                            </div>
                            <div>
                                <p class="font-medium">Cảnh báo:</p>
                                <p>Bạn đang hủy tour trong vòng 7 ngày trước ngày khởi hành. Theo chính sách của chúng tôi, bạn sẽ <span class="font-bold">không được hoàn tiền</span>.</p>
                            </div>
                        </div>
                    </div>
                    
                    <form id="cancelForm" action="cancel-booking" method="post">
                        <input type="hidden" id="cancelBookingId" name="bookingId" value="">
                        <input type="hidden" id="cancelType" name="cancelType" value="">
                        
                        <div class="mb-4">
                            <label for="cancelReason" class="block text-sm font-medium text-gray-700 mb-1">Lý do hủy tour:</label>
                            <textarea id="cancelReason" name="reason" rows="3" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-blue-500 focus:border-blue-500" required></textarea>
                        </div>
                        
                        <div class="flex justify-end space-x-3 mt-6">
                            <button type="button" onclick="closeModal('cancelConfirmationModal')" class="px-4 py-2 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500">
                                Hủy bỏ
                            </button>
                            <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500">
                                Xác nhận hủy tour
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Include Footer -->
        <jsp:include page="components/footer.jsp" />
        
        <script>
            // Function to show booking details modal
            function showBookingDetails(bookingId) {
                // Here we'll get the booking details and display them in the modal
                const modal = document.getElementById('bookingDetailsModal');
                const content = document.getElementById('bookingDetailsContent');
                
                // Create details HTML based on the booking details
                let html = '';
                
                <% for (Booking booking : bookings) { 
                    Trip trip = tripsMap.get(booking.getId());
                    Tour tour = toursMap.get(booking.getId());
                    City departureCity = departureCitiesMap.get(booking.getId());
                    City destinationCity = destinationCitiesMap.get(booking.getId());
                    
                    if (trip != null && tour != null) {
                        double adultPrice = booking.getAdultNumber() * tour.getPriceAdult();
                        double childPrice = booking.getChildNumber() * tour.getPriceChildren();
                        double totalPrice = adultPrice + childPrice;
                        
                        // Calculate days until departure
                        long daysUntilDeparture = -1;
                        boolean canCancel = false;
                        boolean isEarlyCancel = false;
                        
                        if (trip.getDepartureDate() != null) {
                            long diffInMillies = Math.abs(trip.getDepartureDate().getTime() - currentDate.getTime());
                            daysUntilDeparture = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                            
                            // Can cancel if departure date is in the future
                            canCancel = trip.getDepartureDate().after(currentDate) &&
                                       booking.getStatus() != null && 
                                       (booking.getStatus().equals("Đã thanh toán") || booking.getStatus().equals("Đã duyệt"));
                            
                            // Early cancel (>7 days before departure)
                            isEarlyCancel = daysUntilDeparture > 7;
                        }
                %>
                    if (bookingId === <%= booking.getId() %>) {
                        html = `
                            <div class="border border-gray-300 rounded-lg overflow-hidden mb-4">
                                <div class="bg-gray-100 px-6 py-4 border-b">
                                    <div class="flex justify-between items-center">
                                        <h2 class="text-lg font-bold">Thông tin đặt tour</h2>
                                        <% String detailStatusClass = "bg-gray-100 text-gray-800"; %>
                                        <% if (booking.getStatus() != null) {
                                            if (booking.getStatus().equals("Đã thanh toán")) { 
                                                detailStatusClass = "bg-blue-100 text-blue-800";
                                            } else if (booking.getStatus().equals("Đã duyệt")) { 
                                                detailStatusClass = "bg-green-100 text-green-800";
                                            } else if (booking.getStatus().equals("Đã hủy")) { 
                                                detailStatusClass = "bg-red-100 text-red-800";
                                            } else if (booking.getStatus().equals("Đã hủy muộn")) { 
                                                detailStatusClass = "bg-orange-100 text-orange-800";
                                            } else if (booking.getStatus().equals("Hoàn thành")) { 
                                                detailStatusClass = "bg-purple-100 text-purple-800";
                                            }
                                        } %>
                                        <span class="px-3 py-1 rounded-full text-sm font-medium <%= detailStatusClass %>">
                                            <%= booking.getStatus() != null ? booking.getStatus() : "Chưa xác định" %>
                                        </span>
                                    </div>
                                </div>
                                <div class="p-6">
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                        <!-- Tour Info -->
                                        <div>
                                            <h3 class="font-medium mb-3">Thông tin tour</h3>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Mã tour:</div>
                                                <div class="w-2/3 font-medium">#<%= tour.getId() %></div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Tên tour:</div>
                                                <div class="w-2/3 font-medium"><%= tour.getName() %></div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Điểm đến:</div>
                                                <div class="w-2/3 font-medium"><%= departureCity != null ? departureCity.getName() : "Chưa xác định" %></div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Điểm khởi hành:</div>
                                                <div class="w-2/3 font-medium"><%= destinationCity != null ? destinationCity.getName() : "Chưa xác định" %></div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Ngày khởi hành:</div>
                                                <div class="w-2/3 font-medium">
                                                    <% if (trip.getDepartureDate() != null) { %>
                                                        <%= dateFormatter.format(trip.getDepartureDate()) %>, <%= timeFormatter.format(trip.getDepartureDate()) %>
                                                    <% } else { %>
                                                        Chưa xác định
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Ngày kết thúc:</div>
                                                <div class="w-2/3 font-medium">
                                                    <% if (trip.getReturnDate() != null) { %>
                                                        <%= dateFormatter.format(trip.getReturnDate()) %>, <%= timeFormatter.format(trip.getReturnDate()) %>
                                                    <% } else { %>
                                                        Chưa xác định
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Số lượng:</div>
                                                <div class="w-2/3 font-medium">
                                                    <%= booking.getAdultNumber() %> người lớn, <%= booking.getChildNumber() %> trẻ em
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Payment Info -->
                                        <div>
                                            <h3 class="font-medium mb-3">Thông tin thanh toán</h3>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Mã đặt tour:</div>
                                                <div class="w-2/3 font-medium">#<%= booking.getId() %></div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Phương thức:</div>
                                                <div class="w-2/3 font-medium">
                                                    <span class="flex items-center">
                                                        <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-VNPAY-QR.png" alt="VNPAY" class="h-5 mr-2"> 
                                                        VNPAY
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Thời gian:</div>
                                                <div class="w-2/3 font-medium">
                                                    <% if (booking.getCreatedDate() != null) { %>
                                                        <%= dateFormatter.format(booking.getCreatedDate()) %>
                                                    <% } else { %>
                                                        Chưa xác định
                                                    <% } %>
                                                </div>
                                            </div>
                                            <div class="flex items-start mb-3">
                                                <div class="w-1/3 text-gray-600">Tổng tiền:</div>
                                                <div class="w-2/3 font-bold text-red-600">
                                                    <%= currencyFormatter.format(totalPrice) %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Price Breakdown -->
                                    <div class="border-t pt-4">
                                        <h3 class="font-medium mb-3">Chi tiết thanh toán</h3>
                                        <div class="bg-gray-50 p-4 rounded-lg">
                                            <div class="flex justify-between mb-2">
                                                <span>Người lớn: <%= booking.getAdultNumber() %> x <%= currencyFormatter.format(tour.getPriceAdult()) %></span>
                                                <span><%= currencyFormatter.format(adultPrice) %></span>
                                            </div>
                                            <div class="flex justify-between mb-2">
                                                <span>Trẻ em: <%= booking.getChildNumber() %> x <%= currencyFormatter.format(tour.getPriceChildren()) %></span>
                                                <span><%= currencyFormatter.format(childPrice) %></span>
                                            </div>
                                            <div class="flex justify-between font-bold pt-2 border-t">
                                                <span>Tổng cộng:</span>
                                                <span class="text-red-600"><%= currencyFormatter.format(totalPrice) %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Actions -->
                            <div class="flex justify-center space-x-4">
                                <button type="button" onclick="closeModal('bookingDetailsModal')" class="bg-gray-200 text-gray-800 px-6 py-2 rounded-lg hover:bg-gray-300 transition">
                                    <i class="fas fa-times mr-2"></i> Đóng
                                </button>
                                
                                <% if (canCancel) { %>
                                    <!-- Cancel Button - show if trip hasn't started yet -->
                                    <button type="button" 
                                            data-booking-id="<%= booking.getId() %>"
                                            data-cancel-type="<%= isEarlyCancel ? "early" : "late" %>"
                                            onclick="showCancelConfirmation(this.getAttribute('data-booking-id'), this.getAttribute('data-cancel-type'))"
                                            class="bg-red-600 text-white px-6 py-2 rounded-lg hover:bg-red-700 transition">
                                        <i class="fas fa-times-circle mr-2"></i> Hủy tour
                                    </button>
                                <% } %>
                                
                                <a href="tour" class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition text-center">
                                    <i class="fas fa-plus mr-2"></i> Đặt tour khác
                                </a>
                            </div>
                        `;
                    }
                <% 
                    }
                  } 
                %>
                
                // Update modal content
                content.innerHTML = html;
                
                // Show modal
                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            }
            
            // Function to show cancel confirmation modal
            function showCancelConfirmation(bookingId, cancelType) {
                // Close booking details modal if open
                closeModal('bookingDetailsModal');
                
                // Set booking ID in the form
                document.getElementById('cancelBookingId').value = bookingId;
                document.getElementById('cancelType').value = cancelType;
                
                // Show appropriate warning
                if (cancelType === 'early') {
                    document.getElementById('earlyCancelWarning').classList.remove('hidden');
                    document.getElementById('lateCancelWarning').classList.add('hidden');
                    document.getElementById('cancelModalTitle').textContent = 'Xác nhận hủy tour';
                } else {
                    document.getElementById('earlyCancelWarning').classList.add('hidden');
                    document.getElementById('lateCancelWarning').classList.remove('hidden');
                    document.getElementById('cancelModalTitle').textContent = 'Cảnh báo: Hủy tour muộn';
                }
                
                // Show modal
                const modal = document.getElementById('cancelConfirmationModal');
                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            }
            
            // Function to close modal
            function closeModal(modalId) {
                const modal = document.getElementById(modalId);
                modal.classList.add('hidden');
                document.body.style.overflow = 'auto';
            }
            
            // Close modals when clicking outside the content
            document.getElementById('bookingDetailsModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal('bookingDetailsModal');
                }
            });
            
            document.getElementById('cancelConfirmationModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal('cancelConfirmationModal');
                }
            });
        </script>
    </body>
</html> 
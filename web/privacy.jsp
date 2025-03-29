<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chính sách riêng tư - TourNest.vn</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 800px;
                margin: 20px auto;
                background: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h1, h2 {
                color: #333;
            }
            ul {
                list-style-type: disc;
                margin-left: 40px;
                padding-left: 40px;
            }

        </style>
    </head>
    <body>
        <div id="toast" class="toast" role="alert"></div>

        <div id="webcrumbs">
            <div class="font-sans">
                <header class="bg-sky-500 flex flex-col md:flex-row justify-between items-center py-2 px-4 text-white text-sm w-full">
                    <div class="flex items-center mb-2 md:mb-0">
                        <span class="material-symbols-outlined mr-1">call</span>
                        <span>1900 2025 - Từ 9:00 - 12:00 hàng ngày</span>
                    </div>
                    <div>
                        <% if (session.getAttribute("user") != null) { 
                            model.User user = (model.User) session.getAttribute("user"); %>
                        <div class="relative" x-data="{ isOpen: false }">
                            <button @click="isOpen = !isOpen" class="flex items-center space-x-3 focus:outline-none bg-gray-100 hover:bg-gray-200 rounded-full py-2 px-4">
                                <img src="<%= user.getAvatar() != null && !user.getAvatar().isEmpty() ? user.getAvatar() : "https://ui-avatars.com/api/?name=" + user.getFullName() + "&background=random" %>"
                                     alt="avatar" class="w-8 h-8 rounded-full border-2 border-white"/>
                                <span class="font-medium text-gray-700">Xin chào, <%= user.getFullName() %></span>
                                <i class="fas fa-chevron-down text-gray-500 text-sm transition-transform duration-200"
                                   :class="{ 'transform rotate-180': isOpen }"></i>
                            </button>
                            <div x-show="isOpen" @click.away="isOpen = false" class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 z-50">
                                <a href="./user-profile" class="flex items-center px-4 py-2 text-gray-800 hover:bg-gray-100 transition-colors duration-200">
                                    <i class="fas fa-user-circle text-gray-600 w-5"></i>
                                    <span class="ml-2">Hồ sơ của tôi</span>
                                </a>
                                <a href="my-bookings" class="flex items-center px-4 py-2 text-gray-800 hover:bg-gray-100 transition-colors duration-200">
                                    <i class="fas fa-calendar-check text-gray-600 w-5"></i>
                                    <span class="ml-2">Lịch sử đặt tour</span>
                                </a>
                                <hr class="my-1 border-gray-200" />
                                <a href="logout" class="flex items-center px-4 py-2 text-red-600 hover:bg-gray-100 transition-colors duration-200">
                                    <i class="fas fa-sign-out-alt text-red-600 w-5"></i>
                                    <span class="ml-2">Thoát tài khoản</span>
                                </a>
                            </div>
                        </div>
                        <% } else { %>
                        <div class="flex items-center space-x-4">
                            <a href="login" class="text-white hover:text-gray-200">
                                <i class="fas fa-sign-in-alt mr-1"></i> Đăng nhập
                            </a>
                            <a href="register" class="bg-white text-sky-500 px-6 py-2 rounded-full hover:bg-gray-100 transition duration-200">
                                <i class="fas fa-user-plus mr-1"></i> Đăng ký
                            </a>
                        </div>
                        <% } %>
                    </div>
                </header>

                <nav class="py-4 px-4 md:px-8">
                    <div class="flex justify-center items-center">
                        <a href="./home" class="flex items-center">
                            <img src="./image/logo.svg" alt="TourNest Logo" class="h-16 md:h-24 w-auto" />
                        </a>
                    </div>
                    <p class="text-center mt-2">Hãy đến và trải nghiệm những dịch vụ tour du lịch của Tour Nest</p>
                </nav>

                <div class="container">
                    <h1 style="color: blue;"><strong>Chính sách riêng tư</strong></h1>

                    <p>Đây là cách mà chúng tôi sử dụng các cookie trên trang web TourNest của chúng tôi và cũng là cách mà chúng tôi xử lý, bảo vệ những thông tin cá nhân của bạn:</p>

                    <h2><strong>1.Các cookies</strong></h2>
                    <p>Cookie là một file thông tin nhỏ yêu cầu được lưu trữ trên ổ cứng máy tính của bạn. Một khi bạn đồng ý, file này sẽ được lưu trữ và giúp phân tích lưu lượng truy cập trang web hoặc cho bạn biết khi bạn truy cập một trang web cụ thể.</p>
                    <p>Các cookie cho phép các ứng dụng trang web phản hồi thông tin đến bạn trên phương diện cá nhân. Ứng dụng trang web có thể điều chỉnh các hoạt động nhằm đáp ứng các nhu cầu, thích và không thích của bạn bằng cách thu thập và lưu thông tin về sở thích của bạn.</p>
                    <p>Chúng tôi sử dụng các cookie lưu lượng nhằm xác định các trang nào hiện đang được sử dụng. Điều này giúp chúng tôi phân tích dữ liệu về lưu lượng trang web và nâng cấp website của chúng tôi nhằm đáp ứng nhu cầu của khách hàng. Chúng tôi chỉ sử dụng thông tin này cho mục đích phân tích thống kê và sau đó sẽ xóa dữ liệu khỏi hệ thống. Bên cạnh đó, các cookies còn giúp chúng tôi mang lại cho bạn một website tốt hơn bằng cách tạo điều kiện cho chúng tôi theo dõi các trang mà bạn nhận thấy hữu ích hoặc không hữu ích. Một cookie không thể nào giúp chúng tôi truy cập vào máy tính của bạn hoặc bất kỳ thông tin nào về bạn ngoài các dữ liệu mà bạn chọn để chia sẻ với chúng tôi.</p>
                    <p>Bạn có thể lựa chọn chấp nhận hoặc từ chối các cookie. Hầu hết các trình duyệt web tự động chấp nhận các cookie, nhưng bạn có thể thường xuyên thay đổi cài đặt trình duyệt của bạn để từ chối các cookie nếu bạn muốn. Điều này có thể gây cản trở đến việc bạn nhận được lợi ích tối đa từ website.</p>

                    <h2><strong>2. Thanh toán và bảo mật</strong></h2>
                    <p>Tất cả các giao dịch của bạn sẽ được bảo mật bằng bởi hệ thống của VNPAY</p>

                    <h2><strong>3. Chính sách quyền riêng tư</strong></h2>

                    <p>Chúng tôi có thể thu thập những thông tin sau đây: Tên, giới tính, ngày sinh, địa chỉ, email, số điện thoại, sở thích của bạn vv…</p>


                    <p>Chúng tôi yêu cầu những thông tin này để nắm bắt nhu cầu của bạn và mang lại cho bạn một dịch vụ tốt hơn, cụ thể là vì những lý do dưới đây:</p>
                    <ul>
                        <li>   - Nhằm cung cấp cho các Nhà cung cấp dịch vụ liên quan hoàn tất việc đăng ký và đặt tour của bạn.</li>
                        <li>   - Nhằm nâng cấp các sản phẩm và dịch vụ của chúng tôi.</li>
                        <li>   - Gửi đến bạn điểm thưởng, các chương trình khuyến mại theo mùa hay những thông tin đặc biệt khi có vv… Bạn được cho là đồng ý với những thông tin điện tử khi bạn thực hiện một đăng ký hay yêu cầu. Nếu bạn không muốn nhận bất kỳ một email về thông tin khuyến mại nào nữa từ chúng tôi, bạn có thể thay đổi mục preference của bạn trên website của chúng tôi, sử dụng công cụ ‘unsubscribe’ của chúng tôi hoặc liên hệ với chúng tôi.</li>
                        <li>   - Tùy chỉnh website theo sở thích của bạn.</li>
                        <li>   - Đôi lúc có thể chia sẻ và tiết lộ thông tin cá nhân của bạn cho cơ quan chức năng hoặc cơ quan điều tra nếu được yêu cầu theo luật định, hoặc cần thiết cho việc ngăn chặn, phát hiện các hành vi phạm tội và truy tố trước pháp luật để bảo vệ các quyền của khách hàng.</li>
                    </ul>

                    <h2><strong>3. Những thông tin cá nhân</strong></h2>
                    <p>Chúng tôi sẽ không bán, phân phối hoặc cho thuê những thông tin cá nhân của bạn đến bất kỳ bên thứ ba nào khác trừ phi bạn cho phép hoặc được yêu cầu theo luật định.</p>
                    <p>Nếu bạn cho rằng thông tin về bạn mà chúng tôi đang nắm giữ có phần nào không chính xác hoặc chưa đầy đủ, xin vui lòng gửi thông báo bằng văn bản hoặc email cho chúng tôi càng sớm càng tốt theo địa chỉ ở trên. Chúng tôi sẽ hiệu chỉnh ngay mọi thông tin chưa chính xác.</p>

                    <h2><strong>4. Bảo mật thông tin</strong></h2>
                    <p>Chúng tôi cam kết rằng những thông tin của bạn được bảo mật. Để bảo vệ dữ liệu cá nhân mà bạn đã cung cấp cho chúng tôi, chúng tôi đã thực hiện và sử dụng các hệ thống và quy trình quản lý phù hợp.</p>
                    <p>Hơn thế nữa, chúng tôi cũng đã thực hiện và sử dụng các quy trình bảo mật và những hạn chế vật chất và kỹ thuật đối với việc truy cập và sử dụng những thông tin cá nhân. Chỉ những nhân viên được ủy nhiệm mới được phép truy cập những thông tin cá nhân để thực hiện nhiệm vụ của họ đối với các dịch vụ của chúng tôi.</p>

                    <h2><strong>5. Xóa thông tin cá nhân</strong></h2>
                    <p>Nếu cần xóa dữ liệu khỏi các máy chủ Tour Nest vì bất cứ lý do gì, bạn đều có thể gửi email yêu cầu tới email <a href="mailto:support@tournest.vn">support@tournest.vn</a>.</p>
                    <p>Thời gian xử lý xóa toàn bộ thông tin cá nhân là 07 ngày làm việc.</p>

                    <h2><strong>6. Các đường link</strong></h2>
                    <p>Các website hoặc email của chúng tôi có thể có các đường link với các website khác. Khi bạn click vào các đường link này có nghĩa là bạn đã truy cập vào một website khác. Vì thế cho nên chúng tôi không thể chịu trách nhiệm bảo vệ quyền riêng tư đối với bất cứ thông tin nào mà bạn đã cung cấp trong khi truy cập các website khác và các website ấy không chịu sự điều chỉnh theo Chính sách về Quyền riêng tư này. Bạn nên đọc kỹ và xem xét Chính sách về Quyền riêng tư của họ bởi vì các chính sách về Quyền riêng tư của họ có thể khác so với chính sách của chúng tôi.</p>

                    <h2><strong>7. Cập nhật chính sách về quyền riêng tư và cookies</strong></h2>
                    <p>Chúng tôi có quyền thay đổi cách mà chúng tôi sử dụng các cookie và cách mà chúng tôi thu thập, truyền tải và xử lý những thông tin cá nhân của người sử dụng mà chúng tôi cho là cần thiết. Do đó, chính sách này có thể được sửa đổi để phản ánh những thay đổi mới nhất. Có thể bạn không cho là nó giống nhau và bạn đồng ý kiểm lại chính sách này mỗi lần bạn truy cập vào trang web để xem những thay đổi. Việc bạn sử dụng thường xuyên website này chứng tỏ rằng bạn chấp thuận các điều khoản của Chính sách về Quyền riêng tư hoặc mọi sửa đổi của chúng tôi.</p>
                </div>

                <footer class="bg-gray-50 px-4 md:px-8 py-12 w-full mt-12">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 max-w-[1400px] mx-auto">
                        <div>
                            <h2 class="text-2xl font-bold mb-4">Tour<span class="text-sky-500">Nest</span></h2>
                            <p class="text-sm text-gray-600 mb-4">Best Travel Agency</p>
                            <div class="flex gap-4"> 
                                <a href="#" class="text-gray-400 hover:text-[#1877F2] transition">
                                    <i class="fa-brands fa-facebook text-xl"></i>
                                </a> 
                                <a href="#" class="text-gray-400 hover:text-[#1DA1F2] transition">
                                    <i class="fa-brands fa-twitter text-xl"></i>
                                </a> 
                                <a href="#" class="text-gray-400 hover:text-[#E4405F] transition">
                                    <i class="fa-brands fa-instagram text-xl"></i>
                                </a> 
                                <a href="#" class="text-gray-400 hover:text-black transition">
                                    <i class="fa-brands fa-tiktok text-xl"></i>
                                </a> 
                            </div>
                        </div>
                        <div>
                            <h3 class="font-medium mb-4">Liên hệ</h3>
                            <address class="not-italic text-sm text-gray-600 space-y-2">
                                <p>KCNC Hòa Lạc - Thạch Thất - Hà Nội</p>
                                <p>(+84)834197845</p>
                                <p>info@vietravel.com</p>
                            </address>
                        </div>
                        <div>
                            <h3 class="font-medium mb-4">Thông tin</h3>
                            <ul class="text-sm text-gray-600 space-y-2">
                                <li> <a href="#" class="hover:text-sky-500 transition">Tin tức</a> </li>
                                <li> <a href="#" class="hover:text-sky-500 transition">Trợ giúp</a> </li>
                                <li> <a href="./privacy.jsp" class="hover:text-sky-500 transition">Chính sách riêng tư</a> </li>
                                <li> <a href="#" class="hover:text-sky-500 transition">Điều khoản sử dụng</a> </li>
                                <li> <a href="#" class="hover:text-sky-500 transition">Chính sách bảo vệ dữ liệu cá nhân</a> </li>
                            </ul>
                        </div>
                        <div>
                            <h3 class="font-medium mb-4">Liên hệ ngay</h3> 
                            <a href="tel:19001839" class="inline-flex items-center gap-2 bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">
                                <span class="material-symbols-outlined">call</span>
                                1900 1839 
                            </a>
                        </div>
                    </div>
                </footer> 
            </div>
        </div>
    </body>
</html>
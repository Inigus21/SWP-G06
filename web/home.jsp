<%-- 
    Document   : home.jsp
    Created on : Mar 3, 2025, 8:22:44 PM
    Author     : nguye
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TourNest - Trang chủ</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    </head>
    
    <body>
        <div id="webcrumbs">
            <div class="w-full">
                <header class="bg-sky-500 relative z-50">
                    <div class="container mx-auto px-6 py-3">
                        <div class="flex items-center justify-between">
                            <div class="flex items-center gap-4"> <span class="material-symbols-outlined">phone</span>
                                <span>1900
                                    1839 - Từ 8:00 - 11:00 hàng ngày</span>
                            </div>
                            <div class="flex items-center space-x-8">
                                    <div class="relative" x-data="{ isOpen: false }">
                                        <button class="flex items-center space-x-3 focus:outline-none bg-gray-100 hover:bg-gray-200 rounded-full py-2 px-4">
                                            <img src="" 
                                                 alt="avatar" 
                                                 class="w-8 h-8 rounded-full border-2 border-white"/>
                                            <span class="font-medium text-gray-700">Xin chào tên_ngườ_dùng</span>
                                            <i class="fas fa-chevron-down text-gray-500 text-sm transition-transform duration-200"
                                               :class="{ 'transform rotate-180': isOpen }"></i>
                                        </button>
                                        
                                        <!-- Dropdown menu -->
                                        <div x-show="isOpen" 
                                             @click.away="isOpen = false"
                                             x-transition:enter="transition ease-out duration-200"
                                             x-transition:enter-start="opacity-0 transform scale-95"
                                             x-transition:enter-end="opacity-100 transform scale-100"
                                             x-transition:leave="transition ease-in duration-75"
                                             x-transition:leave-start="opacity-100 transform scale-100"
                                             x-transition:leave-end="opacity-0 transform scale-95"
                                             class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 z-50"
                                             style="display: none;">
                                            <a href="./user-profile" 
                                               class="flex items-center px-4 py-2 text-gray-800 hover:bg-gray-100 transition-colors duration-200">
                                                <i class="fas fa-user-circle text-gray-600 w-5"></i>
                                                <span class="ml-2">Thông tin của tôi</span>
                                            </a>
                                            <a href="my-bookings" 
                                               class="flex items-center px-4 py-2 text-gray-800 hover:bg-gray-100 transition-colors duration-200">
                                                <i class="fas fa-calendar-check text-gray-600 w-5"></i>
                                                <span class="ml-2">Đơn đặt tour</span>
                                            </a>
                                            <hr class="my-1 border-gray-200"/>
                                            <a href="logout" 
                                               class="flex items-center px-4 py-2 text-red-600 hover:bg-gray-100 transition-colors duration-200">
                                                <i class="fas fa-sign-out-alt text-red-600 w-5"></i>
                                                <span class="ml-2">Đăng xuất</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="flex items-center space-x-4">
                                        <a href="login" class="text-gray-600 hover:text-gray-900">
                                            <i class="fas fa-sign-in-alt mr-1"></i>
                                            Đăng nhập
                                        </a>
                                        <a href="register"
                                            class="bg-blue-600 text-white px-6 py-2 rounded-full hover:bg-blue-700 transition duration-200">
                                            <i class="fas fa-user-plus mr-1"></i>
                                            Đăng ký
                                        </a>
                                    </div>
                            </div>
                        </div>
                    </div>
                </header>
                <nav class="flex items-center justify-between p-4 bg-white sticky top-0 z-40">
                    <a href="#" class="flex items-center">
                        <img src="./image/logo.svg" alt="TourNest Logo" style="height: 100px; width: auto;" />
                    </a>
                    <div class="flex items-center gap-8"> <a href="#" class="hover:text-blue-500 transition">Trang
                            chủ</a>
                        <a href="#" class="hover:text-blue-500 transition">Địa điểm</a> <a href="./tour"
                            class="hover:text-blue-500 transition">Tour</a> <a href="#"
                            class="hover:text-blue-500 transition">Liên hệ</a>
                    </div>
                </nav>
                <main>
                    <div class="relative h-[600px]"> <img
                            src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
                            class="w-full h-full object-cover" alt="Beach" />
                        <div class="absolute inset-0 bg-black/20"></div>
                        <div class="absolute bottom-32 left-8 text-white">
                            <h1 class="text-4xl font-bold mb-2">Đặt tour du lịch!</h1>
                            <p>Hơn 500 tour du lịch trong nước từ Bắc vào Nam</p>
                        </div>
                        <div class="absolute right-8 top-1/2 -translate-y-1/2 text-white text-right">
                            <div class="flex items-center gap-2 mb-4"> <span
                                    class="material-symbols-outlined text-4xl">public</span>
                                <h2 class="text-4xl font-bold">Enjoy Your</h2>
                            </div>
                            <p class="text-6xl font-light italic mb-8">Traveling</p> <button
                                class="bg-white text-black px-8 py-2 rounded hover:bg-blue-50 transition">BOOK
                                NOW</button>
                            <p class="mt-4">TourNest.site.com</p>
                        </div>
                        <div
                            class="absolute -bottom-20 left-1/2 -translate-x-1/2 bg-white rounded-lg shadow-xl p-6 w-[800px]">
                            <form action="tour" method="GET" class="grid grid-cols-3 gap-4">
                                <div class="relative"> 
                                    <span class="material-symbols-outlined absolute left-3 top-3">location_on</span>
                                    <input type="text" name="search" placeholder="Bạn muốn đi đâu ?"
                                        class="w-full pl-10 pr-4 py-2 border rounded hover:border-blue-500 focus:border-blue-500 focus:outline-none transition" />
                                </div>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3 top-3">calendar_month</span>
                                    <input type="date" name="date" placeholder="Chọn ngày khởi hành"
                                        class="w-full pl-10 pr-4 py-2 border rounded hover:border-blue-500 focus:border-blue-500 focus:outline-none transition"
                                        onfocus="this.showPicker()" onblur="if(!this.value) this.type='text'"
                                        onclick="this.type='date'" type="text" />
                                </div>
                                <div class="flex gap-4">
                                    <select name="departure" class="w-full pl-10 pr-4 py-2 border rounded hover:border-blue-500 focus:border-blue-500 focus:outline-none transition">
                                        <option value="">Khởi hành từ</option>
                                            <option>Điểm đến</option>
                                    </select>
                                    <button type="submit" class="bg-blue-500 text-white px-8 rounded hover:bg-blue-600 transition">Tìm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="mt-32 px-8">
                        <div class="flex justify-center gap-16 mb-16">
                            <div class="text-center group cursor-pointer">
                                <div class="bg-blue-50 p-4 rounded-lg mb-2 group-hover:bg-blue-100 transition">
                                    <span class="material-symbols-outlined text-3xl">hiking</span> </div>
                                <p>Hình thức du lịch 1</p>
                            </div>
                            <div class="text-center group cursor-pointer">
                                <div class="bg-blue-50 p-4 rounded-lg mb-2 group-hover:bg-blue-100 transition">
                                    <span class="material-symbols-outlined text-3xl">experience</span> </div>
                                <p>Hình thức du lịch 2</p>
                            </div>
                        </div>
                        <section class="mb-16">
                            <h2 class="text-2xl font-bold mb-8 text-center">CÁC ĐỊA ĐIỂM YÊU THÍCH</h2>
                            <p class="text-center mb-8 text-gray-600">Các địa điểm yêu thích của du khách đang giá
                                rẻ đợt này</p>
                            <div class="grid grid-cols-2 gap-8">
                                <div class="relative h-[240px] rounded-lg overflow-hidden group cursor-pointer">
                                    <img src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Đà Nẵng"
                                        class="w-full h-full object-cover group-hover:scale-110 transition duration-500" />
                                    <div class="absolute inset-0 bg-black/20 group-hover:bg-black/40 transition">
                                    </div>
                                    <h3 class="absolute bottom-4 left-4 text-white text-xl font-bold">Đà Nẵng</h3>
                                </div>
                                <div class="relative h-[240px] rounded-lg overflow-hidden group cursor-pointer">
                                    <img src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Huế"
                                        class="w-full h-full object-cover group-hover:scale-110 transition duration-500" />
                                    <div class="absolute inset-0 bg-black/20 group-hover:bg-black/40 transition">
                                    </div>
                                    <h3 class="absolute bottom-4 left-4 text-white text-xl font-bold">Huế</h3>
                                </div>
                                <div class="relative h-[240px] rounded-lg overflow-hidden group cursor-pointer">
                                    <img src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Cần Thơ"
                                        class="w-full h-full object-cover group-hover:scale-110 transition duration-500" />
                                    <div class="absolute inset-0 bg-black/20 group-hover:bg-black/40 transition">
                                    </div>
                                    <h3 class="absolute bottom-4 left-4 text-white text-xl font-bold">Cần Thơ</h3>
                                </div>
                                <div class="relative h-[240px] rounded-lg overflow-hidden group cursor-pointer">
                                    <img src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Hạ Long"
                                        class="w-full h-full object-cover group-hover:scale-110 transition duration-500" />
                                    <div class="absolute inset-0 bg-black/20 group-hover:bg-black/40 transition">
                                    </div>
                                    <h3 class="absolute bottom-4 left-4 text-white text-xl font-bold">Hạ Long</h3>
                                </div>
                            </div>
                        </section>
                        <section class="mb-16">
                            <h2 class="text-2xl font-bold mb-8 text-center">Tour</h2>
                            <p class="text-center mb-8 text-gray-600">Các tour du lịch được tổ chức với đội ngũ nhân
                                viên
                                chuyên nghiệp</p>
                            <div class="grid grid-cols-3 gap-8">
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour Tây Bắc</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 30</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                25/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-blue-500">10.990.000 đ</p>
                                            </div> <button
                                                class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour Sapa</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 30</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                25/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-blue-500">10.990.000 đ</p>
                                            </div> <button
                                                class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour Mộc Châu</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 30</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                25/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-blue-500">10.990.000 đ</p>
                                            </div> <button
                                                class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center mt-8"> <button
                                    class="border border-blue-500 text-blue-500 px-8 py-2 rounded hover:bg-blue-50 transition">Xem
                                    tất cả</button> </div>
                        </section>
                        <section class="mb-16">
                            <h2 class="text-2xl font-bold mb-8 text-center">Ưu đãi giờ chót</h2>
                            <p class="text-center mb-8 text-gray-600">Nhanh tay nắm bắt cơ hội giảm giá cuối cùng.
                                Đặt ngay
                                để không bỏ lỡi</p>
                            <div class="grid grid-cols-3 gap-8">
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                        <div
                                            class="absolute top-4 left-4 bg-red-500 text-white px-2 py-1 rounded text-sm">
                                            Giờ chót</div>
                                        <div
                                            class="absolute bottom-4 right-4 bg-white text-red-500 px-2 py-1 rounded text-sm font-bold">
                                            02:24:45</div>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour Bắc - Nam</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 1</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                20/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-red-500">4.290.000 đ</p>
                                                <p class="text-sm line-through text-gray-400">4.990.000 đ</p>
                                            </div> <button
                                                class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                        <div
                                            class="absolute top-4 left-4 bg-red-500 text-white px-2 py-1 rounded text-sm">
                                            Giờ chót</div>
                                        <div
                                            class="absolute bottom-4 right-4 bg-white text-red-500 px-2 py-1 rounded text-sm font-bold">
                                            03:55:34</div>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour HCM - Safari</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 7</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                20/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-red-500">4.990.000 đ</p>
                                                <p class="text-sm line-through text-gray-400">5.990.000 đ</p>
                                            </div> <button
                                                class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg overflow-hidden group">
                                    <div class="relative"> <img
                                            src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                            alt="Tour"
                                            class="w-full h-[200px] object-cover group-hover:scale-110 transition duration-500" />
                                        <span
                                            class="absolute top-4 right-4 material-symbols-outlined text-white bg-black/50 p-1 rounded-full cursor-pointer hover:bg-black/70 transition">favorite</span>
                                        <div
                                            class="absolute top-4 left-4 bg-red-500 text-white px-2 py-1 rounded text-sm">
                                            Giờ chót</div>
                                        <div
                                            class="absolute bottom-4 right-4 bg-white text-red-500 px-2 py-1 rounded text-sm font-bold">
                                            03:24:42</div>
                                    </div>
                                    <div class="p-4">
                                        <h3 class="font-bold mb-2">Tour Quy Nhơn</h3>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-2"> <span
                                                class="material-symbols-outlined">schedule</span> <span>4N3Đ</span>
                                            <span>|</span> <span>Số chỗ còn nhận: 4</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-sm text-gray-600 mb-4"> <span
                                                class="material-symbols-outlined">calendar_today</span> <span>Khởi
                                                hành:
                                                20/02/2025</span> </div>
                                        <div class="flex items-center justify-between">
                                            <div>
                                                <p class="text-sm text-gray-600">Giá từ:</p>
                                                <p class="text-xl font-bold text-red-500">4.890.000 đ</p>
                                                <p class="text-sm line-through text-gray-400">5.490.000 đ</p>
                                            </div> <button
                                                class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition">Đặt
                                                ngay</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center mt-8"> <button
                                    class="border border-blue-500 text-blue-500 px-8 py-2 rounded hover:bg-blue-50 transition">Xem
                                    tất cả</button> </div>
                        </section>
                        <section class="mb-16">
                            <h2 class="text-2xl font-bold mb-8 text-center">Đánh giá</h2>
                            <p class="text-center mb-8 text-gray-600">Ý kiến của khách hàng về trải nghiệm của dịch
                                vụ khác
                                của TourNest</p>
                            <div class="grid grid-cols-3 gap-8">
                                <div class="bg-white rounded-lg shadow-lg p-6"> <img
                                        src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Review" class="w-full h-[200px] object-cover rounded-lg mb-4" />
                                    <p class="text-gray-600 mb-4">&quot;Mình đã có một trải nghiệm tuyệt vời với
                                        dịch vụ của
                                        TourNest. Đồng hành cùng TourNest, mình đã thấy được những dịch vụ tốt nhất
                                        và khó
                                        quên trong cuộc hành trình của mình.&quot;</p>
                                    <p class="font-bold">- Chi Linh - Nha Trang 2024-</p>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg p-6"> <img
                                        src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Review" class="w-full h-[200px] object-cover rounded-lg mb-4" />
                                    <p class="text-gray-600 mb-4">&quot;Sau khi có những trải nghiệm tuyệt vời cùng
                                        dịch vụ
                                        của TourNest, gia đình nhanh chóng sắp xếp để sử dụng những dịch vụ tốt khác
                                        của các
                                        bạn và không thể khiến tôi phàn nàn về những dịch vụ của TourNest.&quot;</p>
                                    <p class="font-bold">- Anh Minh - Hạ Long 2024-</p>
                                </div>
                                <div class="bg-white rounded-lg shadow-lg p-6"> <img
                                        src="https://images.unsplash.com/photo-1583417319070-4a69db38a482"
                                        alt="Review" class="w-full h-[200px] object-cover rounded-lg mb-4" />
                                    <p class="text-gray-600 mb-4">&quot;Du lịch là nơi để để lại những trải nghiệm
                                        khó quên
                                        và TourNest đã mang lại cho gia đình tôi những trải nghiệm tốt nhất.&quot;
                                    </p>
                                    <p class="font-bold">- Chi Hạnh - Đà Lạt 2024-</p>
                                </div>
                            </div>
                        </section>
                    </div>
                </main>
                <footer class="bg-gray-100 px-8 py-12 w-full">
                    <div class="grid grid-cols-4 gap-8 mb-8">
                        <div>
                            <h3 class="text-2xl font-bold mb-4">TourNest</h3>
                            <p class="text-gray-600 mb-4">KCNC Hòa Lạc - Thạch Thất - Hà Nội</p>
                            <p class="text-gray-600">(+84)8341679645</p>
                            <p class="text-gray-600 mb-4">tournest@gmail.com</p>
                            <div class="flex gap-4"> <a href="#"
                                    class="text-gray-600 hover:text-blue-500 transition"> <i
                                        class="fa-brands fa-facebook text-2xl"></i> </a> <a href="#"
                                    class="text-gray-600 hover:text-blue-500 transition"> <i
                                        class="fa-brands fa-twitter text-2xl"></i> </a> <a href="#"
                                    class="text-gray-600 hover:text-blue-500 transition"> <i
                                        class="fa-brands fa-instagram text-2xl"></i> </a> <a href="#"
                                    class="text-gray-600 hover:text-blue-500 transition"> <i
                                        class="fa-brands fa-youtube text-2xl"></i> </a> </div>
                        </div>
                        <div>
                            <h3 class="font-bold mb-4">Thông tin</h3>
                            <ul class="space-y-2">
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Trợ giúp</a>
                                </li>
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Chính sách bảo
                                        mật</a>
                                </li>
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Điều khoản sử
                                        dụng</a>
                                </li>
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Chính sách đổi
                                        trả và
                                        lấy lại tiền</a></li>
                            </ul>
                        </div>
                        <div>
                            <h3 class="font-bold mb-4">Hỗ trợ</h3>
                            <ul class="space-y-2">
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">FAQs</a></li>
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Liên hệ</a>
                                </li>
                                <li><a href="#" class="text-gray-600 hover:text-blue-500 transition">Blog</a></li>
                            </ul>
                        </div>
                        <div>
                            <h3 class="font-bold mb-4">Tải ứng dụng</h3>
                            <div class="space-y-4"> <button
                                    class="bg-black text-white px-6 py-2 rounded flex items-center gap-2 hover:bg-gray-800 transition w-full">
                                    <i class="fa-brands fa-apple text-2xl"></i>
                                    <div class="text-left">
                                        <p class="text-xs">Download on the</p>
                                        <p class="font-bold">App Store</p>
                                    </div>
                                </button> </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
    
</html>

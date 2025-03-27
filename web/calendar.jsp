<%-- 
    Document   : calendar
    Created on : Feb 28, 2025, 1:58:20 AM
    Author     : Lom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My Webcrumbs Plugin</title>
        <style>
            @import url(https://fonts.googleapis.com/css2?family=Poppins&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Roboto&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200);
        </style>
    </head>
    <body>
        <div id="webcrumbs">
            <div class="w-[700px] rounded-lg border border-gray-200 p-6">
                <div class="mb-6">
                    <div class="flex items-center justify-between mb-6">
                        <button id="prev-month" class="w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors">
                            <span class="material-symbols-outlined">arrow_back_ios</span>
                        </button>
                        <h2 class="text-xl font-bold text-center" id="calendar-title"><!-- Month title goes here --></h2>
                        <button id="next-month" class="w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors">
                            <span class="material-symbols-outlined">arrow_forward_ios</span>
                        </button>
                    </div>
                    <div class="grid grid-cols-7 gap-2 mb-4">
                        <div class="text-center font-medium">T2</div>
                        <div class="text-center font-medium">T3</div>
                        <div class="text-center font-medium">T4</div>
                        <div class="text-center font-medium">T5</div>
                        <div class="text-center font-medium">T6</div>
                        <div class="text-center font-medium">T7</div>
                        <div class="text-center font-medium">CN</div>
                    </div>
                    <div id="calendar-days" class="grid grid-cols-7 gap-2">
                        <!-- Calendar days will be generated by JavaScript -->
                    </div>
                </div>
                <p class="text-red-500 italic text-sm">Quý khách vui lòng chọn ngày có chuyến khởi hành</p>
            </div>
        </div>

        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                content: ["./src/**/*.{html,js}"],
                theme: {
                    name: "Custom",
                    fontFamily: {
                        sans: [
                            "Poppins",
                            "ui-sans-serif",
                            "system-ui",
                            "sans-serif",
                            '"Apple Color Emoji"',
                            '"Segoe UI Emoji"',
                            '"Segoe UI Symbol"',
                            '"Noto Color Emoji"'
                        ]
                    },
                    extend: {
                        fontFamily: {
                            title: [
                                "Poppins",
                                "ui-sans-serif",
                                "system-ui",
                                "sans-serif",
                                '"Apple Color Emoji"',
                                '"Segoe UI Emoji"',
                                '"Segoe UI Symbol"',
                                '"Noto Color Emoji"'
                            ],
                            body: [
                                "Roboto",
                                "ui-sans-serif",
                                "system-ui",
                                "sans-serif",
                                '"Apple Color Emoji"',
                                '"Segoe UI Emoji"',
                                '"Segoe UI Symbol"',
                                '"Noto Color Emoji"'
                            ]
                        },
                        colors: {
                            neutral: {
                                50: "#E0F7FA",
                                100: "#D9F0F3",
                                200: "#D3E8EB",
                                300: "#CCE1E4",
                                400: "#C5D9DC",
                                500: "#BED2D5",
                                600: "#5A6364",
                                700: "#434A4B",
                                800: "#2D3132",
                                900: "#161919",
                                DEFAULT: "#E0F7FA"
                            },
                            primary: {
                                50: "#ecf7ff",
                                100: "#d5ebff",
                                200: "#b5deff",
                                300: "#82caff",
                                400: "#47abff",
                                500: "#1d86ff",
                                600: "#0563ff",
                                700: "#004cf6",
                                800: "#073eca",
                                900: "#0d399b",
                                950: "#0d245e",
                                DEFAULT: "#073eca"
                            }
                        }
                    },
                    fontSize: {
                        xs: ["12px", {lineHeight: "19.200000000000003px"}],
                        sm: ["14px", {lineHeight: "21px"}],
                        base: ["16px", {lineHeight: "25.6px"}],
                        lg: ["18px", {lineHeight: "27px"}],
                        xl: ["20px", {lineHeight: "28px"}],
                        "2xl": ["24px", {lineHeight: "31.200000000000003px"}],
                        "3xl": ["30px", {lineHeight: "36px"}],
                        "4xl": ["36px", {lineHeight: "41.4px"}],
                        "5xl": ["48px", {lineHeight: "52.800000000000004px"}],
                        "6xl": ["60px", {lineHeight: "66px"}],
                        "7xl": ["72px", {lineHeight: "75.60000000000001px"}],
                        "8xl": ["96px", {lineHeight: "100.80000000000001px"}],
                        "9xl": ["128px", {lineHeight: "134.4px"}]
                    },
                    borderRadius: {
                        none: "0px",
                        sm: "6px",
                        DEFAULT: "12px",
                        md: "18px",
                        lg: "24px",
                        xl: "36px",
                        "2xl": "48px",
                        "3xl": "72px",
                        full: "9999px"
                    },
                    spacing: {
                        0: "0px",
                        1: "4px",
                        2: "8px",
                        3: "12px",
                        4: "16px",
                        5: "20px",
                        6: "24px",
                        7: "28px",
                        8: "32px",
                        9: "36px",
                        10: "40px",
                        11: "44px",
                        12: "48px",
                        14: "56px",
                        16: "64px",
                        20: "80px",
                        24: "96px",
                        28: "112px",
                        32: "128px",
                        36: "144px",
                        40: "160px",
                        44: "176px",
                        48: "192px",
                        52: "208px",
                        56: "224px",
                        60: "240px",
                        64: "256px",
                        72: "288px",
                        80: "320px",
                        96: "384px",
                        px: "1px",
                        0.5: "2px",
                        1.5: "6px",
                        2.5: "10px",
                        3.5: "14px"
                    }
                },
                plugins: [],
                important: "#webcrumbs"
            }
        </script>
    </body>
</html>

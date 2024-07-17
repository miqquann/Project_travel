/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
    // Initialize Flatpickr for date range
    flatpickr("#date-range", {
        mode: "range",
        dateFormat: "Y-m-d",
        onClose: function (selectedDates, dateStr, instance) {
            console.log("Selected dates:", selectedDates);
            console.log("Date string:", dateStr);
        }
    });
});



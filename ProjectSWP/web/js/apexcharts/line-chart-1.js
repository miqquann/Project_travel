(function ($) {
    var tfLineChart = (function () {
        var chartBar = function () {
            var options = {
                series: [
                    {
                        data: [20, 50, 7, 100, 30, 80, 100],
                    },
                ],
                colors: ["#22C55E"],
                chart: {
                    type: "area",
                    width: 96,
                    height: 28,
                    sparkline: {enabled: true},
                    animations: {enabled: false}, // Disable animations for static display
                    toolbar: {show: false} // Disable the toolbar
                },
                xaxis: {
                    labels: {show: false}, // Hide x-axis labels
                    axisBorder: {show: false},
                    axisTicks: {show: false},
                    crosshairs: {show: false} // Hide crosshairs
                },
                yaxis: {
                    labels: {show: false} // Hide y-axis labels
                },
                stroke: {
                    show: true,
                    curve: "smooth",
                    width: 3
                },
                tooltip: {
                    enabled: false // Disable tooltips
                },
                grid: {
                    show: false // Hide grid
                },
                markers: {
                    size: 0 // Hide markers
                },
                states: {
                    hover: {
                        filter: {
                            type: "none",
                            value: 0
                        }
                    },
                    active: {
                        filter: {
                            type: "none",
                            value: 0
                        }
                    }
                }
            };

            var chart = new ApexCharts(
                    document.querySelector("#line-chart-1"),
                    options
                    );
            if ($("#line-chart-1").length > 0) {
                chart.render();
            }
        };

        return {
            init: function () {},
            load: function () {
                chartBar();
            },
            resize: function () {}
        };
    })();

    jQuery(document).ready(function () {});

    jQuery(window).on("load", function () {
        tfLineChart.load();
    });

    jQuery(window).on("resize", function () {});
})(jQuery);

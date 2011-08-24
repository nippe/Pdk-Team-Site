/**
 * Created by JetBrains WebStorm.
 * User: niklasni
 * Date: 2011-07-07
 * Time: 09:29
 * To change this template use File | Settings | File Templates.
 */

var formatDateOnly = '%Y-%m-%d';
var formatDateAndTime = '%Y-%m-%d %H:%i';
var currentFormat = formatDateAndTime;

var dateConverter = new AnyTime.Converter({format: currentFormat});
var oneAndAHalfHour = 90 * 60 * 1000;


$(document).ready(
    function() {
        $('.date-input').AnyTime_picker(
            {
                format: formatDateAndTime
            }
        );

        $('#activity_start_at').blur(
            function() {
                var startTime = dateConverter.parse($(this).val()).getTime();
                var defaultEndDate = new Date(startTime + oneAndAHalfHour);
                $('#activity_end_at').val(dateConverter.format(defaultEndDate));
            }
        );

        $('#activity_all_day').click(
            function() {
                if ($(this).prop('checked') == true) {
                    dateConverter = new AnyTime.Converter({format: formatDateOnly});
                    currentFormat = formatDateOnly;
                }
                else {
                    dateConverter = new AnyTime.Converter({format: formatDateAndTime});
                    currentFormat = formatDateAndTime;
                }

                $('.date-input').each(
                    function() {
                        // Extract and remove
                        var tmp = dateConverter.parse($(this).val()).getTime();
                        $(this).AnyTime_noPicker();

                        // Massage date time
                        var date = new Date(tmp);
                        if (currentFormat == formatDateAndTime) {
                            date.setHours(0, 0, 0, 0);
                        }

                        // Add and fill
                        $(this).AnyTime_picker({format: currentFormat});
                        $(this).val(dateConverter.format(date));
                    }
                );


            }
        );


        $('select').msDropDown({mainCSS:'dd'});

        $('a#href-select-all').click(
            function() {
                $('div#players-list-container').children().children().children().prop('checked', true).parent().highlightFade({color: 'yellow', speed: 2500});  //.effect('highlight', {backgroundColor: "#ffffff"}, 1500);
            }
        );

        $('a#href-clear-all').click(
            function() {
                $('div#players-list-container').children().children().children().prop('checked', false);  //.effect('highlight', {backgroundColor: "#ffffff"}, 1500);

            }
        );

        $('#href-select-players').click(
            function() {
                $('.player-chk').prop('checked', true).addClass('selected-player');
                $('.player-chk').parent().highlightFade({color: 'yellow', speed: 2500});
            }
        );

        $('#href-select-guests').click(
            function() {
                $('.guest-chk').prop('checked', true).addClass('selected-player');
                $('.guest-chk').parent().highlightFade({color: 'yellow', speed: 2500});
            }
        );

    }
);


/*
 if ($(this).children('.arrow-collapsed').attr('src').indexOf('expanded') > 0) {
    $(this).children(".arrow-collapsed").attr({src: 'images/indicators/bar-arrow.png' });
}
else {
    $(this).children(".arrow-collapsed").attr({src: 'images/indicators/bar-arrow-expanded.png' });
}


 var oneDay = 24 * 60 * 60 * 1000;
 var rangeDemoFormat = "%e-%b-%Y";
 var rangeDemoConv = new AnyTime.Converter({format:rangeDemoFormat});
 $("#rangeDemoToday").click(function(e) {
 $("#rangeDemoStart").val(rangeDemoConv.format(new Date())).change();
 });
 $("#rangeDemoClear").click(function(e) {
 $("#rangeDemoStart").val("").change();
 });
 $("#rangeDemoStart").AnyTime_picker({format:rangeDemoFormat});
 $("#rangeDemoStart").change(function(e) {
 try {
 var fromDay = rangeDemoConv.parse($("#rangeDemoStart").val()).getTime();
 var dayLater = new Date(fromDay + oneDay);
 dayLater.setHours(0, 0, 0, 0);
 var ninetyDaysLater = new Date(fromDay + (90 * oneDay));
 ninetyDaysLater.setHours(23, 59, 59, 999);
 $("#rangeDemoFinish").
 AnyTime_noPicker().
 removeAttr("disabled").
 val(rangeDemoConv.format(dayLater)).
 AnyTime_picker(
 { earliest: dayLater,
 format: rangeDemoFormat,
 latest: ninetyDaysLater
 });
 } catch(e) {
 $("#rangeDemoFinish").val("").attr("disabled", "disabled");
 }
 });

 */
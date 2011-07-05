/**
 * Created by pdk-team-site.
 * User: niklasni
 * Date: 2011-07-04
 * Time: 11:31
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(
        function() {
            $(".bars-container").click(
                    function() {
                        $(this).children("div").toggle("slow");
                        //               alert('/activities/show/' + $(this).attr('id').split('-').pop() + '.json');

                        if ($(this).children('.arrow-collapsed').attr('src').indexOf('expanded') > 0) {
                            $(this).children(".arrow-collapsed").attr({src: '/images/indicators/arrow_state_blue_collapsed.png' });
                        }
                        else {
                            $(this).children(".arrow-collapsed").attr({src: '/images/indicators/arrow_state_blue_expanded.png' });
                        }
                    }
                    );
        }
        );


$(document).ready(
        function() {
            var action;
            $(".rvsp-dropdown").change(
                    function() {
                        rvspElementRef = $(this);

                        //alert($(this).parent().parent().find('.nav-green-bar').eq(0).attr('height', '20'));

                        if ($(this).val() == 1) {
                            $(this).removeClass('background-yellow').removeClass('background-red').removeClass('background-grey').addClass('background-green');
                            action = 'attend';
                        }
                        else if ($(this).val() == 2) {
                            $(this).removeClass('background-green').removeClass('background-red').removeClass('background-grey').addClass('background-yellow');
                            action = 'maybe';
                        }
                        else {
                            $(this).removeClass('background-green').removeClass('background-yellow').removeClass('background-grey').addClass('background-red');
                            action = 'not';
                        }

                        var str = '/activities/';
                        var activityId = $(this).attr('id').split('-').pop();

                        var url = '/activities/' + activityId + '/rvsps/' + action + '/' + userId + '.json';
                        //alert(url);
                        $.getJSON(
                                url,
                                function(json) {
                                    var totalCount = json.activity_summary.attending + json.activity_summary.maybe + json.activity_summary.not_comming + json.activity_summary.no_answer;
                                    var greenHeight = Math.round(((json.activity_summary.attending / totalCount) * 14));
                                    rvspElementRef.parent().parent().find('.nav-green-bar').eq(0).attr('height', greenHeight);

                                    var yellowHeight = Math.round((json.activity_summary.maybe / totalCount) * 14);
                                    rvspElementRef.parent().parent().find('.nav-yellow-bar').eq(0).attr('height', yellowHeight);

                                    var redHeight = Math.round((json.activity_summary.not_comming / totalCount) * 14);
                                    rvspElementRef.parent().parent().find('.nav-red-bar').eq(0).attr('height', redHeight);

                                    //$('.nav-green-bar').attr('height', '125');
                                    //alert($(this).tagName);  //.find('.nav-green-bar').attr('height', '258');
                                    //alert($(this).parent('td').parent('tr').children('.bar-decoration').eq(1).text());
                                }
                                );
                    }
                    );
        }
        );

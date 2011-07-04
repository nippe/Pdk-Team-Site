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
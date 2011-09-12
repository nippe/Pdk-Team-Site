/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-09-12
 * Time: 08:51
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(
        function() {
            $('#show-players-link').click(
                    function() {
                        $('.player-small-box').each(
                                function() {
                                    if ($(this).hasClass('role-player')) {
                                        $(this).attr("style", "");
                                    }
                                    else {
                                        $(this).attr("style", "display: none;");
                                    }
                                }
                        );
                    }
            );
        }
);

$(document).ready(
        function() {
            $('#show-guests-link').click(
                    function() {
                        $('.player-small-box').each(
                                function() {
                                    if ($(this).hasClass('role-guest')) {
                                        $(this).attr("style", "");
                                    }
                                    else {
                                        $(this).attr("style", "display: none;");
                                    }
                                }
                        );
                    }
            );
        }
);

$(document).ready(
        function() {
            $('#show-all-users-link').click(
                    function() {
                        $('.player-small-box').attr('style', '');
                    }
            );
        }
);



/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-10-31
 * Time: 10:59
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(

    function() {
        $('.i-have-paid-button').click(
            function() {
                var debt_id = $(this).attr('id').split('-')[1];
                var url = '/debts/' + debt_id + '/paid.json';

                $.getJSON(
                    url,
                    function(json) {
                        alert('Du påstår att du betalat ' + json.debt.sum + ' spänn');
                        $(this).parent().parent().addClass('debt-paid');
                        //TODO: Highligt and remove link and write "waiting for approval"..
                    }
                );
            }
        )
    }
);


$(document).ready(
    function() {
        $('.collapsible-region ul li').not(':children ul').click(
            function() {
                $(this).children('ul').slideDown('slow');
            }
        );

    }
);


$(document).ready(
    function() {
        $('.debt-approval-link').click(
            function() {
                var debt_id = $(this).attr('id').split('-')[2];
                var url = '/debts/' + debt_id + '/approve_payment';

                $.getJSON(
                    url,
                    function(json) {
                        alert('Ajax call executed gracefully, now for DOM manipulation');
                        $(this).parent().parent().toggle('slow');

                    }
                );
            }
        );

    }
);


$(document).ready(
    function(){
        $('.debt-summary li :first').addClass('pointer-cursor');
    }
);



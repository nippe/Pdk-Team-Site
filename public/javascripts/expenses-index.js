/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-10-31
 * Time: 10:59
 * To change this template use File | Settings | File Templates.
 */




$(document).ready(

        function(){
            $('.i-have-paid-button').click(
                function() {
                    var debt_id = $(this).attr('id').split('-')[1];

                    $.ajax(
                        {
                            url: '/debts/debt_id',
                            type: POST,
                            success: function() { $(this).parent.addClass('debt-paid'); }
                        }
                    );


                }
            )
        }

);

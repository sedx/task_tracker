// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });
$(function() {
    var source
    $( "#analyze, #doing, #testing, #released, #archived" ).sortable({
        start: function( event, ui ) { source= $(ui.item.context).parent().attr('id') },
        stop: function( event, ui ) {
            var destination = $(ui.item.context).parent().attr('id')
            if (destination != source){
                //$.post( "/move_task",
                //    {task: ui.item.context.id.replace('task_',''),
                //    to: destination}).done(function( data ) {
                //    $( "body" ).html( data );
                //})};},
            $.ajax({
                type: "POST",
                url: "/move_task",
                data: "task="+ui.item.context.id.replace('task_','')+"&to="+$(ui.item.context).parent().attr('id')
            })}},
        connectWith: ".connectedSortable",
        items:"li[id^='task_']"
    }).disableSelection();
});

$('.task').on('sortstop', function(event, ui) {
    console.log(this.paernt);
});
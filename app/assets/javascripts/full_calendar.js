var initialize_calendar;
initialize_calendar = function(){
    $('#calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            header: {
                left: 'prev, next, today',
                center: 'title',
                right: 'month, agendaWeek, agendaDay'
            },
            selectable: true,
            selectHelper: true, 
            editable: true, 
            eventLimit: true,
            events: '/schedules.json',

            select: function(date) {
                $.getScript('/schedules/new?date='+date.format(), function(){
                });
                calendar.fullCalendar('unselect');
            },
            eventDrop: function(schedule, delta, revertFunc) {
                event_data = { 
                  schedule: {
                    id: schedule.id,
                    start: schedule.start.format(),
                    end: schedule.end.format()
                  }
                };
                $.ajax({
                    url: schedule.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
              }, 
              eventClick: function(schedule, jsEvent, view) {
                if (gon.current_user.coach_auth == true) {
                    $.getScript(schedule.edit_url, function() {
                    });
                } else {
                    $.getScript('/user_schedules/new?schedule='+schedule.id, function() {
                    });
                }
              }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);
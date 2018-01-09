//The main functionality of the calendar. .fullCalendar creates the calendar, and the header gives functionality to the top bar. 
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
//Select grabs the new schedule form on click, adding the calendar date for the Schedule Controller to use. 
            select: function(date) {
                $.getScript('/schedules/new?date='+date.format(), function(){
                });
                calendar.fullCalendar('unselect');
            },
//Allows the schedule to be dropped from the calendar. 
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
//When you click a created schedule on the calendar the eventClick checks if coach Authenticate on the current user is true, if it is, then you can edit the created schedule. If you are just a user, then it will open the user schedule form and pass it the schedule info. 
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
//functionality for the autocomplete when users go to create or join a gym.
jQuery(function() {
    return $('#user_gym_name').autocomplete({
      source: $('#user_gym_name').data('autocomplete-source')
    });
  });

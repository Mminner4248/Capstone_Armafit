jQuery(function() {
    return $('#user_gym_name').autocomplete({
      source: $('#user_gym_name').data('autocomplete-source')
    });
  });

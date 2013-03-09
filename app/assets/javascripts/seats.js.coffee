jQuery ->
  $("#sortable-items").sortable({
    cursor: 'move',
    handle: '.m_title',
    items: 'td',
    placeholder: 'ui-state-highlight',
    update: ->
      $.ajax({
        url: '/seats/sort',
        type: 'post',
        data: $(this).sortable('serialize'),
        dataType: 'script',
        success: (data, status) ->
          $('td div.position', '#sortable-items').each( (index) ->
            $(this).text(index + 1)
          )
          $('td', '#sortable-items').effect('highlight')
          # location.reload()
      })
  })

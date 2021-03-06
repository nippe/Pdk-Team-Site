if defined?(Footnotes) && Rails.env.development?
  Footnotes.run! # first of all

  # ... other init code
  Footnotes.setup do |config|
    config.before { |controller, filter| filter.notes = controller.class.name =~ /Activ/ ? [:assigns] : [] }

#    config.before { |controller, filter| filter.notes = controller.class.name =~ /Activ/ && \
#    controller.action_name == 'index' ? [:assigns] : [] }

  end

  #Footnotes::Filter.no_style       = true

  #Footnotes::Filter.multiple_notes = true
  Footnotes::Filter.notes          = [:session, :cookies, :params, :filters, :routes, :env, :queries, :log, :general]
end
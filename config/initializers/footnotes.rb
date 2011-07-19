if defined?(Footnotes) && Rails.env.development?
  Footnotes.run! # first of all

  # ... other init code
  Footnotes.setup do |config|
    config.before { |controller, filter| filter.notes = controller.class.name =~ /User/ && \
    controller.action_name == 'index' ? [:assigns] : [] }

    config.before { |controller, filter| filter.notes |= [:params] if controller.class.name =~ /Activity/ && \
    controller.action_name == 'edit' }

    config.before { |controller, filter| filter.notes |= [:params] if controller.class.name =~ /Activity/ && \
    controller.action_name == 'update' }

    config.before { |controller, filter| filter.notes |= [:params] if controller.class.name =~ /Activity/ && \
    controller.action_name == 'show' }

    config.before { |controller, filter| filter.notes |= [:params] if controller.class.name =~ /Activity/ && \
    controller.action_name == 'index' }
  end

  #Footnotes::Filter.no_style       = true

  #Footnotes::Filter.multiple_notes = true
  Footnotes::Filter.notes          = [:session, :cookies, :params, :filters, :routes, :env, :queries, :log, :general]
end
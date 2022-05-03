- dashboard: test_vw
  title: DWF Operational Stats
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Interactions by day
    name: Interactions by day
    model: vw_prod_tst
    explore: session
    type: looker_area
    fields: [session.count, session.created_date]
    fill_fields: [session.created_date]
    filters:
      intentdetails.created_date: 120 days
      intentdetails.intent: "-VW - main flow"
    sorts: [session.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application: undefined
    series_types: {}
    series_labels: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: []
    hidden_points_if_no: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: session.created_date
    row: 4
    col: 0
    width: 24
    height: 7
  - title: Engagements
    name: Engagements
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.count]
    filters:
      intentdetails.created_date: 120 days
      intentdetails.intent: "-VW - main flow"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    custom_color: "#12B5CB"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: []
    hidden_points_if_no: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: session.created_date
    row: 0
    col: 4
    width: 5
    height: 4
  - title: Top Intents
    name: Top Intents
    model: vw_prod_tst
    explore: session
    type: looker_wordcloud
    fields: [intentdetails.count, intentdetails.trimmed20_intent]
    filters:
      intentdetails.trimmed20_intent: -"Default Fallback In",-Escalation
        Path,-ErrorCode Retry Flo,-Call Back Flow,-appreciation,-yes,-Yes,-greeting,-Anything
        Else
      intentdetails.created_date: 30 days
    sorts: [intentdetails.count desc]
    limit: 20
    color_application: undefined
    rotation: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: session.created_date
    row: 11
    col: 0
    width: 24
    height: 10
  - title: Interactions
    name: Interactions
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: session.created_date
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Messages
    name: Messages
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [sessionhistory.count]
    filters:
      sessionhistory.eventtype: messageReceived
    sorts: [sessionhistory.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#9334E6"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: sessionhistory.created_date
    row: 0
    col: 14
    width: 5
    height: 4
  - title: User Messages
    name: User Messages
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [sessionhistory.count]
    filters:
      sessionhistory.eventtype: messageReceived
      sessionhistory.partytype: customer
    sorts: [sessionhistory.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#079c98"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Business Unit: session.businessunitid
      Interaction Date: sessionhistory.created_date
    row: 0
    col: 19
    width: 5
    height: 4
  - title: Escalations
    name: Escalations
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [sessionhistory.messagetext, sessionhistory.count]
    filters:
      sessionhistory.messagetext: Great! A live chat agent will be with you shortly.
        Please keep this chat window open.
    sorts: [sessionhistory.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E8710A"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Business Unit: session.businessunitid
    row: 0
    col: 9
    width: 5
    height: 4
  filters:
  - name: Interaction Date
    title: Interaction Date
    type: field_filter
    default_value: 60 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: vw_prod_tst
    explore: session
    listens_to_filters: []
    field: session.created_date
  - name: Business Unit
    title: Business Unit
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []

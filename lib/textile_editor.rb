# TextileEditor
module TextileEditorHelper
  def textile_editor(object, field, options={})
    editor_id = '%s_%s' % [object, field]
    mode      = options.delete(:simple) ? 'simple' : 'extended'
    (@textile_editor_ids ||= []) << [editor_id, mode]
    text_area(object, field, options)
  end
  
  def textile_editor_initialize
    editor_ids = @textile_editor_ids || []
    output = []
    output << stylesheet_link_tag('button_styles', 'editor_styles')
    output << javascript_include_tag('text-tags')
    output << '<script type="text/javascript">'
    output << 'addLoadEvent(initTextileEditors);'
    output << 'function initTextileEditors() {'
    editor_ids.each do |editor_id, mode|
      output << "edToolbar('%s', '%s');" % [editor_id, mode]
    end
    output << '}'
    output << '</script>'
  end
end
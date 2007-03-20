require File.dirname(__FILE__) + '/abstract_unit'
require File.dirname(__FILE__) + '/../lib/textile_editor_helper'
require 'ostruct'

class TextileEditorHelperTest < Test::Unit::TestCase
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormHelper
  include TextileEditorHelper
    
  def setup
    @controller = Class.new do
      attr_reader :url_for_options
      def url_for(options, *parameters_for_method_reference)
        @url_for_options = options
        "http://www.example.com"
      end
      
      def request;  @request  ||= ActionController::TestRequest.new;  end
      def response; @response ||= ActionController::TestResponse.new; end
    end
    @controller = @controller.new    
    @article = OpenStruct.new(:body => nil)
  end
  
  # support methods
  def create_simple_editor(object, field, options={})
    output = textile_editor(object, field, options.merge(:simple => true))
    assert_equal  text_area(object, field, options), output
  end  

  def create_extended_editor(object, field, options={})
    output = textile_editor(object, field, options)
    assert_equal  text_area(object, field, options), output
  end  
  
  def pre_initialize_output
    %{<link href="/stylesheets/button_styles.css" media="screen" rel="Stylesheet" type="text/css" />
      <link href="/stylesheets/editor_styles.css" media="screen" rel="Stylesheet" type="text/css" />
      <script src="/javascripts/text-tags.js" type="text/javascript"></script>
      <script type="text/javascript">
      addLoadEvent(initTextileEditors);
      function initTextileEditors() \{}
  end
  
  def post_initialize_output
    %{\}
      </script>
    }
  end
  
  def expected_initialize_output(editors)
    expected = [pre_initialize_output]
    expected << editors.map do |editor|
      "edToolbar('%s', '%s');" % editor
    end
    expected << post_initialize_output
    expected.join("\n").split("\n").map { |e| e.lstrip }.join("\n").chomp
  end
  
  # tests
  def test_textile_editor
    assert_nil @textile_editor_ids
    create_extended_editor('article', 'body')
    assert_equal [['article_body', 'extended']], @textile_editor_ids
  end
  
  def test_textile_editor_simple_mode
    assert_nil @textile_editor_ids
    create_simple_editor('article', 'body')
    assert_equal [['article_body', 'simple']], @textile_editor_ids
  end
  
  def test_textile_editor_with_custom_id
    assert_nil @textile_editor_ids
    create_extended_editor('article', 'body', :id => 'my_custom_id')
    assert_equal [['my_custom_id', 'extended']], @textile_editor_ids
  end  
  
  def test_textile_editor_simple_mode_with_custom_id
    assert_nil @textile_editor_ids
    create_simple_editor('article', 'body', :id => 'my_custom_id')
    assert_equal [['my_custom_id', 'simple']], @textile_editor_ids
  end
  
  def test_textile_editor_initialize
    create_extended_editor('article', 'body')
    output = textile_editor_initialize()
    assert_equal expected_initialize_output([
      ['article_body', 'extended']
    ]), output
    
    create_simple_editor('article', 'body_excerpt')
    output = textile_editor_initialize()
    assert_equal expected_initialize_output([
      ['article_body', 'extended'],
      ['article_body_excerpt', 'simple']
    ]), output
  end
end
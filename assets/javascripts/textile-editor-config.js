// Define Button Object
function edButton(id, display, tagStart, tagEnd, access, title, sve, open) {
	this.id = id;				// used to name the toolbar button
	this.display = display;		// label on button
	this.tagStart = tagStart; 	// open tag
	this.tagEnd = tagEnd;		// close tag
	this.access = access;		// set to -1 if tag does not need to be closed
	this.title = title;			// sets the title attribute of the button to give 'tool tips'
	this.sve = sve;				// sve = simple vs. extended. add an 's' to make it show up in the simple toolbar
	this.open = open;			// set to -1 if tag does not need to be closed
	this.custom = false;  // standard buttons are not custom
}

function edButtonCustom(id, display, onclick, title, sve) {
	this.id = id;
	this.display = display;
	this.onclick = onclick;
	this.title = title;
	this.sve = sve;
	this.custom = true;
}

function edButtonSeparator(sve) {
	this.separator = true;
	this.sve = sve;
}

var theButtons = new Array();
var edOpenTags = new Array();

theButtons.push(new edButton('ed_strong',			'bold.png',          '*',   '*',  'b', 'Bold','s'));
theButtons.push(new edButton('ed_emphasis',		'italic.png',        '_',   '_',  'i', 'Italicize','s'));
theButtons.push(new edButton('ed_underline',	'underline.png',     '+',   '+',  'u', 'Underline','s'));
theButtons.push(new edButton('ed_strike',     'strikethrough.png', '-',   '-',  's', 'Strikethrough','s'));
theButtons.push(new edButton('ed_ol',					'list_bullets.png',  ' # ', '\n', ',', 'Numbered List'));
theButtons.push(new edButton('ed_ul',					'list_numbers.png',  ' * ', '\n', '.', 'Bulleted List'));
theButtons.push(new edButton('ed_p',					'paragraph.png',     'p',   '\n', 'p', 'Paragraph'));
theButtons.push(new edButton('ed_h1',					'h1.png',            'h1',  '\n', '1', 'Header 1'));
theButtons.push(new edButton('ed_h2',					'h2.png',            'h2',  '\n', '2', 'Header 2'));
theButtons.push(new edButton('ed_h3',					'h3.png',            'h3',  '\n', '3', 'Header 3'));
theButtons.push(new edButton('ed_h4',					'h4.png',            'h4',  '\n', '4', 'Header 4'));
theButtons.push(new edButton('ed_block',   		'blockquote.png',    'bq',  '\n', 'q', 'Blockquote'));
theButtons.push(new edButton('ed_outdent', 		'outdent.png',       ')',   '\n', ']', 'Outdent'));
theButtons.push(new edButton('ed_indent',  		'indent.png',        '(',   '\n', '[', 'Indent'));
theButtons.push(new edButton('ed_justifyl',		'left.png',          '<',   '\n', 'l', 'Left Justify'));
theButtons.push(new edButton('ed_justifyc',		'center.png',        '=',   '\n', 'e', 'Center Text'));
theButtons.push(new edButton('ed_justifyr',		'right.png',         '>',   '\n', 'r', 'Right Justify'));
theButtons.push(new edButton('ed_justify', 		'justify.png',       '<>',  '\n', 'j', 'Justify'));

/*
theButtons[theButtons.length] = new edButton('ed_code','code','@','@','c','Code');
*/
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
}

var theButtons = new Array();
var edOpenTags = new Array();

theButtons[theButtons.length] = new edButton('ed_strong','str','*','*','b','Bold','s');
theButtons[theButtons.length] = new edButton('ed_emphasis','em','_','_','i','Italicize','s');
theButtons[theButtons.length] = new edButton('ed_underline','u','+','+','u','Underline','s');
theButtons[theButtons.length] = new edButton('ed_strike','S','-','-','s','Strikethrough','s');
theButtons[theButtons.length] = new edButton('ed_ol','OL',' # ','\n',',','Numbered List');
theButtons[theButtons.length] = new edButton('ed_ul','UL',' * ','\n','.','Bulleted List');
theButtons[theButtons.length] = new edButton('ed_p','P','p','\n','p','Paragraph');
theButtons[theButtons.length] = new edButton('ed_h1','h1','h1','\n','1','Header 1');
theButtons[theButtons.length] = new edButton('ed_h2','h2','h2','\n','2','Header 2');
theButtons[theButtons.length] = new edButton('ed_h3','h3','h3','\n','3','Header 3');
theButtons[theButtons.length] = new edButton('ed_h4','h4','h4','\n','4','Header 4');
theButtons[theButtons.length] = new edButton('ed_block','b-quote','bq','\n','q','Blockquote');
theButtons[theButtons.length] = new edButton('ed_outdent','OUT',')','\n',']','Outdent');
theButtons[theButtons.length] = new edButton('ed_indent','IN','(','\n','[','Indent');
theButtons[theButtons.length] = new edButton('ed_justifyl','JL','<','\n','l','Left Justify');
theButtons[theButtons.length] = new edButton('ed_justifyc','JC','=','\n','e','Center Text');
theButtons[theButtons.length] = new edButton('ed_justifyr','JR','>','\n','r','Right Justify');
theButtons[theButtons.length] = new edButton('ed_justify','J','<>','\n','j','Justify');																					
/*
theButtons[theButtons.length] = new edButton('ed_code','code','@','@','c','Code');
*/
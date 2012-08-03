/*
 * jQuery inlineEdit
 *
 * Copyright (c) 2009 Ca-Phun Ung <caphun at yelotofu dot com>
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://yelotofu.com/labs/jquery/snippets/inlineEdit/
 *
 * Inline (in-place) editing.
 *
 * @version 0.2.1
 */

(function($) {

    $.fn.inlineEdit = function(options) {

        options = $.extend({
            hover: 'hover',
            value: '',
            save: '',
            buttonText: 'Save',
            textarea: '0',
            placeholder: 'Click to edit'
        }, options);

        return $.each(this, function() {
            $.inlineEdit(this, options);
        });
    }

    $.inlineEdit = function(obj, options) {
        var self = $(obj),
            placeholderHtml = '<span class="inlineEdit-placeholder">'+ options.placeholder +'</span>';

        self.value = function(newValue) {
            if (arguments.length) {
                self.data('value', $(newValue).hasClass('inlineEdit-placeholder') ? '' : newValue);
            }
            return self.data('value');
        }
        
        self.id = obj.id;
        self.value($.trim(self.text()) || options.value);

        self.bind('click', function(event) {
            var $this = $(event.target);

            if ($this.is('button')) {
                var hash = {
                    value: $input = $this.siblings('#desc').val(),
                    id: $this.siblings('#id').val()
                };

                if (($.isFunction(options.save) && options.save.call(self, event, hash)) !== false || !options.save) {
                    self.value(hash.value);
                }

            } else if ($this.is(self[0].tagName) || $this.hasClass('inlineEdit-placeholder')) {
            	var input_item = '<input id="id" type="hidden" value="'+ self.id +'"><input id="desc" class="input-xlarge span6" type="text" value="'+ self.value() +'">';
            	if(options.textarea == "1"){
            		//input_item = '<input id="id" type="hidden" value="'+ self.id +'"><textarea class="input-xlarge span8" id="desc" rows="8">'+ self.value() +'</textarea><br/>';
            		input_item = '<input id="id" type="hidden" value="'+ self.id +'"><textarea id="desc" class="textarea" placeholder="Enter text ..." style="width: 810px; height: 200px">'+ self.value() +'</textarea>';
            	}
                self
                    .html(input_item + ' <button class="btn btn-success">'+ options.buttonText +'</button>')
                    .find('#desc')
                        .bind('blur', function() {
                            if (self.timer) {
                                window.clearTimeout(self.timer);
                            }
                            self.timer = window.setTimeout(function() {
                                self.html(self.value() || placeholderHtml);
                                self.removeClass(options.hover);
                            }, 200);
                        })
                        .focus();
            }
        })
        .hover(
            function(){
                $(this).addClass(options.hover);
            },
            function(){
                $(this).removeClass(options.hover);
            }
        );

        if (!self.value()) {
            self.html($(placeholderHtml));
        } else if (options.value) {
            self.html(options.value);
        }
    }

})(jQuery);
/*
 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.stylesSet.add( 'custom',
    [
        /* Block Styles */

        // These styles are already available in the "Format" combo, so they are
        // not needed here by default. You may enable them to avoid placing the
        // "Format" combo in the toolbar, maintaining the same features.
        /*
         { name : 'Paragraph'		, element : 'p' },
         { name : 'Heading 1'		, element : 'h1' },
         { name : 'Heading 2'		, element : 'h2' },
         { name : 'Heading 3'		, element : 'h3' },
         { name : 'Heading 4'		, element : 'h4' },
         { name : 'Heading 5'		, element : 'h5' },
         { name : 'Heading 6'		, element : 'h6' },
         { name : 'Preformatted Text', element : 'pre' },
         { name : 'Address'			, element : 'address' },
         */

        /* Inline Styles */

        // These are core styles available as toolbar buttons. You may opt enabling
        // some of them in the Styles combo, removing them from the toolbar.
        /*
         { name : 'Strong'			, element : 'strong', overrides : 'b' },
         { name : 'Emphasis'		, element : 'em'	, overrides : 'i' },
         { name : 'Underline'		, element : 'u' },
         { name : 'Strikethrough'	, element : 'strike' },
         { name : 'Subscript'		, element : 'sub' },
         { name : 'Superscript'		, element : 'sup' },
         */

        { name : 'Fancybox',
            element : 'img',
            attributes : {
                'class' : 'fancybox border featured'
            }
        },

        { name : 'Deleted Text'		, element : 'del' },
        { name : 'Inserted Text'	, element : 'ins' },

        { name : 'Inline Quotation'	, element : 'q' },

        /* Object Styles

        {
            name : 'Image on Left',
            element : 'img',
            attributes :
            {
                'style' : 'padding: 5px; margin-right: 5px',
                'border' : '2',
                'align' : 'left'
            }
        },

        {
            name : 'Image on Right',
            element : 'img',
            attributes :
            {
                'style' : 'padding: 5px; margin-left: 5px',
                'border' : '2',
                'align' : 'right'
            }
        },

         */

        { name : 'Borderless Table', element : 'table', styles: { 'border-style': 'hidden', 'background-color' : '#E6E6FA' } },
        { name : 'Square Bulleted List', element : 'ul', styles : { 'list-style-type' : 'square' } }
    ]);

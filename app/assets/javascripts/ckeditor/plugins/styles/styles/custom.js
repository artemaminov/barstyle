/*
 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

// Set defaults for tables
CKEDITOR.on( 'dialogDefinition', function( ev )
{
    // Take the dialog name and its definition from the event
    // data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;

    // Check if the definition is from the dialog we're
    // interested on (the "Table" dialog).
    if ( dialogName == 'table' )
    {
        // Get a reference to the "Table Info" tab.
        var infoTab = dialogDefinition.getContents( 'info' );
        txtWidth = infoTab.get( 'txtWidth' );
        txtWidth['default'] = '100%';
//        cmbWidthType = infoTab.get( 'cmbWidthType' );
//        cmbWidthType['default'] = 'percents';
//        txtCellPad = infoTab.get( 'txtCellPad' );
//        txtCellPad['default'] = 4;
    }
});

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
        { name : 'Перечеркнутый текст'		, element : 'del' },
        { name : 'Вставленный текст'	, element : 'ins' },
        { name : 'Цитата'	, element : 'q' },

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
        { name : 'Абзац', element : 'p', styles : { 'clear' : 'both' }},
        { name : 'Таблица без обрамления', element : 'table', styles : { 'border-style' : 'hidden', 'background-color' : '#E6E6FA' }},
        { name : 'Список с квадратными маркерами', element : 'ul', styles : { 'list-style-type' : 'square' }}
    ]);
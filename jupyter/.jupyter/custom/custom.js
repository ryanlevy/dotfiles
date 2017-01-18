define([
    'base/js/namespace',
    'base/js/events'
    ],
    function(IPython, events) {
        events.on("app_initialized.NotebookApp",
            function () {
                //default to line numbers being shown
                IPython.Cell.options_default.cm_config.lineNumbers = true;
            }
        );
    }
);
$([Jupyter.events]).on("app_initialized.NotebookApp", function () {
    //default hide top bar
    $('div#header-container').hide();
    //$('div#maintoolbar').hide();
});

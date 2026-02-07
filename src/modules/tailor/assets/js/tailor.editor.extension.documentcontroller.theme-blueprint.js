oc.Modules.register('tailor.editor.extension.documentcontroller.theme-blueprint', function() {
    'use strict';

    const DocumentControllerBase = oc.Modules.import('tailor.editor.extension.documentcontroller.blueprint');

    class DocumentControllerBlueprint extends DocumentControllerBase {
        get documentType() {
            return 'tailor-theme-blueprint';
        }
    }

    return DocumentControllerBlueprint;
});

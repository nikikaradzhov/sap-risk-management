//This file defines the content of the work list page and the object page

using RiskService from '../../srv/risk-service';

// Risk List Report Page annotations
annotate RiskService.Risks with @(UI : {
    HeaderInfo      : {
        TypeName       : 'Risk',
        TypeNamePlural : 'Risks',
        Title          : {
            $Type : 'UI.DataField',
            Value : title
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : descr
        }
    },
    SelectionFields : [prio], // defines which of the properties are exposed as search fields in the header bar above the list
    Identification  : [{Value : title}],
    // Define the table columns
    LineItem        : [ // all the columns and their order of the work list
        {Value : title},
        {Value : miti_ID},
        {Value : owner},
        {Value : bp_BusinessPartner},
        {
            Value       : prio,
            Criticality : criticality // adds a diamond icon right left of the fields
        },
        {
            Value       : impact,
            Criticality : criticality // adds a diamond icon right left of the fields
        },
    ],
});

// Risk Object Page annotations
annotate RiskService.Risks with @(UI : {
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Main',
        Target : '@UI.FieldGroup#Main',
    }],
    FieldGroup #Main : {Data : [ // just shows up as a form; properties of the Data array within FieldGroup#Main determine the fields in the form
        {Value : miti_ID},
        {Value : owner},
        {Value : bp_BusinessPartner},
        {
            Value       : prio,
            Criticality : criticality
        },
        {
            Value       : impact,
            Criticality : criticality
        }
    ]},
});

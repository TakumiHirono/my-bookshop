using CatalogService as service from '../../srv/cat-service';
annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Book ID',
                Value : book_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country',
                Value : country_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Amount',
                Value : amount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Book ID',
            Value : book_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : book.title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Country',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
    ],
    UI.SelectionFields : [
        book_ID,
    ],
    UI.HeaderInfo : {
        TypeName : '{i18n>Order}',
        TypeNamePlural : '{i18n>Orders}',
        Title : {
            $Type : 'UI.DataField',
            Value : book.title,
        },
        TypeImageUrl : 'sap-icon://course-book',
    },
);

annotate service.Orders with {
    book @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Books',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : book_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'author_ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'stock',
                },
            ],
        },
        Common.Label : '{i18n>BookId}',
    )
};


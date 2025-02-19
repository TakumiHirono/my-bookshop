using { CatalogService as external } from './external/CatalogService';

service BooksService {
    @readonly
    entity Books as projection on external.Books{
        key ID,
        title,
        stock
    }actions{
        action updateTitle(title: String);
        action deleteBook(ID: Integer);
    };

    action createBook(book: Books) returns Books;
}

const cds = require('@sap/cds')

module.exports = class BooksService extends cds.ApplicationService{
    init(){
        this.on('READ','Books',async(req) => {
            //req.query.where `stock > 10` // フィルタ条件追加
            const service = await cds.connect.to('CatalogService')
            return await service.run(req.query)
        })

        //unbound action
        this.on('createBook', async(req) => {
            const book = req.data.book
            const query = INSERT.into('Books').entries(book)
            const service = await cds.connect.to('CatalogService')
            return await service.run(query)
        })

        this.on('updateTitle', 'Books', async(req) => {
            const newTitle = req.data.title
            const id = req.params[0]
            const query = UPDATE('Books',{ID: id}).with({
                title:newTitle
            })
            const service = await cds.connect.to('CatalogService')
            return await service.run(query)
        })

        this.on('deleteBook', 'Books', async(req) => {
            const id = req.params[0]
            const query = DELETE.from('Books').where ({ID: id})
            const service = await cds.connect.to('CatalogService')
            return await service.run(query)
        })

        return super.init()
    }
}
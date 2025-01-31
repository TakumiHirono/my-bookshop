const { serialize } = require("@sap/cds/lib/utils/csv-reader")

module.exports = (srv) => {
 
    // ピザの注文時処理
    srv.before ('CREATE', 'Orders', async (req) => {
      const order = req.data

      // 注文数チェック
      if (!order.quantity || order.quantity <= 0)  return req.error (400, '注文は1つ以上を指定してください。')

      // 注文ピザの1つ辺りの金額を取得
      let query = SELECT.from `Pizzas` .where({ID: order.pizza_ID}) 
      let pizzaPrice = await cds.db.run(query)

      // 注文ピザの合計金額を取得
      let pizzaAmount = pizzaPrice[0]["price"] * order.quantity

      // 注文ピザの合計金額としてセット
      order.amount = pizzaAmount
    })
}
  
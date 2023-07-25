# Cupcake business

Your friend has started her own cupcake business and is being extremely
successful! Because she is swamped by orders, she doesn’t have the time to
answer questions about the cost of her products. She would like you to write a
program that people can use to calculate how much they will need to pay for the
cupcakes.

| Bread             | Frosting              | Filling              |
| ----------------- | --------------------- | -------------------- |
| vanilla \$0.50    | vanilla \$0.60        | nutella \$1.00       |
| chocolate \$0.75  | oreo \$1.10           | strawberry \$0.55    |
| red velvet \$0.85 | mint chocolate \$1.45 | peanut butter \$0.45 |

People can skip the filling (choosing not to request one), but both the bread
and frosting are mandatory for it to be a proper cupcake!

She has 3 presentations:

- "individual": 1 cupcake, no discount
- "six pack": 6 cupcakes), gives a discount of 4% over the total price
- "dozen pack": (12 cupcakes), gives a discount of 10% over the total price

Write the method:

```ruby
def calculate_price(presentation, bread, frosting, filling)

end
```

to calculate how much they will need to pay for the cupcakes. Remember that the
filling is optional so make the required adjustments to the method heading. The
result should be returned rounded to 2 decimal places.

It is possible that you need to slice the problem into smaller pieces (extra
methods) in order to not offend Rubocop.

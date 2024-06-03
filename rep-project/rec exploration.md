# Developmenet of the Recommendation Engine.

  

There are 3 main steps to develop the recommendation engine:

  

1. Data Reformating.

2. Building a Common Recommendation Engine Abstract Class

3. Using the common class to report on the accuracy of each model

  
  

## Data Reformating. Data to be reformated and saved as following structure:

  

transactions:

  

| name       | type | description                          |

| ---------- | ---- | ------------------------------------ |

| id         | str  | Unique identifier of the transaction |

| user_id    | str  | Unique identifier of the user        |

| product_id | str  | Unique identifier of the product     |

| rate       | int  | Rate of the product                  |

  

Note:

**Rate**: The rate is a value between 1 and 5. 1 being the lowest and 5 being the highest.

In some cases if the calification is using buy/view/etc will be codified as buy: 5, cart: 3, view: 1. etc.

  

products:

  

| name          | type | description                          |

| ------------- | ---- | ------------------------------------ |

| id            | str  | Unique identifier of the product     |

| product_title | str  | Title of the product                 |

| product_image | str  | Image of the product                 |

| product_price | int  | Price of the product                 |

  
  

users:

  

Users demographics will not be considered. Thus the user will be a simple id.

  
  
  

## Building an recommendation engine that allows for all recommmendations/

  

Run all them.

  
  

Develop the pseudocode for each:

  
  

```python

  

class RecommendationAbstract:

    strategy_name:str = ...

    version:str = ...

    details:str = ...

    link:str = ...

    supports_single_recommendation:bool = ...

    supports_past_recommendation:bool = ...

  

    def __init__(self, products):

        self.products = products

  

    def loadModel(self, model_code):

        """

        Load the data

        """

        self.model = model_code

  

    def train(verbose=False, transactions_train, users_train):

        """

        Train the model

        """

        ... do trainning

  

        self.model = trained_model

  

        pass

  

    def saveModel(self, model_code):

        """

        Save the model

        """

        # ... saves in the path, common method shared.

  

    def id_to_productDetail(str) -> Dict[str]:

        return self.id_to_products

  

    def ids_to_products(str) -> List[str] -> List[Dict[str]]:

        for id in ids:

            self.id_to_productDetail(id)

  

    def like(str) -> List[str]:

        """

        Return a list of products that are similar to the given string.

        """

        return [product for product in self.products if str in product.product_title]

  

    def recommned_from_single(product_id, n=5) -> List[str]:

        """Overwrite or default implementation

        """

        target_name = self.id_to_productDetail(product_id).product_title

        keywords = target_name.split(" ")

        recommendations = []

        for keyword in keywords:

            recommendations.extends(self.like(keyword))

        random.shuffle(recommendations)

        return recommendations[:, n]

  

    def recommend_from_past(user_transactions, n=10) -> List[str]:

        rec = []

        for transaction in user_transactions:

            rec.extend(self.recommend_from_single(transaction.product_id))

        random.shuffle(rec)

        return rec[:n]

  

class CosineSimilarity(RecommendationAbstract):

    # Complete Cosine Similarity Details

  

    def __init__(self, products):

        products

  

    def recommend_from_single(str):

        if self.supports_single_recommendation:

            pass

        else:

            return super().recommend_from_single(str) # Default implementaiton using like method.

  

    def recommend_from_past():

        pass

  

```

  

## Using the common class to report on the accuracy of each model

  

- [ ] Designing input and Output

- [ ] Design basic tests.

- [ ] Input should be the item selected

  
  
  

Designing Performance Tests.

  

Follwing are the tests to run. There are two cases of performances to run:

  

- [ ] Products Recommendations

  

This works by understanding the following:

- This is more subjective. Does the recommendation of this product make sense? (wont be evaluated, just runned through common sense) And see automatically the difference. Perhaps the best commute recommendation is by the products that all share in common.

  

- [ ] User Transaction Recommendations

  

- This can sort of be evaluated. But since they are different by each comparison, almost aomporing apple with oranges. But the idea is to see if the recommendation makes sense.

  
  

Pseudocode

```python

  
  

# Initialize each recommender with the appropriate products data.

list_of_rec_engines[RecommendationAbstract] = [...]

# For each recommedation engine, start trainning the model.

for rec_engine in list_of_rec_engines:

    rec_engine.train(transactions, users)

  

# Data clean up

transactions_cleanup = [clean_up(transaction) for transaction in transactions]

remove_users_with_less_than_6_transactions(users, transactions)

  

userA, userB = split(users)

user_transactions_a, user_transactions_b = split_transaction_by_users(transactions)

"""

user_transactions_1:

{

    "user_id": [transaction1: {user, product, rate}, transaction2: {user, product, rate}]

}

"""

  
  

# Train the models

for rec_engine in list_of_rec_engines:

    rec_engine.train(transactions_a, userA)

  
  

"""

scores = {

    "rec_engine1": 0.5,

    "rec_engine2": 0.6,

}

"""

scores = {}

# Using hit, miss, estimate the score of the model: accuracy, precision, recall, f1-score

# accuracy: (hit + miss) / total

# precision: hit / (hit + miss)

# recall: hit / (hit + miss)

# f1-score: 2 * (precision * recall) / (precision + recall)

  

# Test the models

for rec_engine in list_of_rec_engines:

    score = 0

    for transaction in transactions:

        past_transactions: List[id],  predict_partition:List[id] = extract_xy_transaction(transaction)

        recommendations = rec_engine.recommend_from_past(past_transactions)

        hit = 0

        miss = 0

        # If any of the recommendations are

        for recommnedation in recommnedations:

            if recommendation in predict_partition:

                accurate += 1

            else:

                miss -= 1

    # Store the score of the rec_engine

    scores[rec_engine] = score

  

```

  

Item selected shoudl have things

  
  

## Implementation Streamlit Pseudocode

  
  

```python

  

engines = {

    "CosineSimilarity": CosineSimilarity,

    ...

}

  

recommend_single_engine = st.dropdown("Select the recommendation engine", engines.keys(), default="CosineSimilarity")

recommend_past_engine = st.dropdown("Select the recommendation engine", engines.keys(), default="CosineSimilarity")

transactions = []

  

products_type = "books" # Support more in the future

PRODUCT_CASES = {

    "books": {"Harry Potter Fan": [{product_id: xxxx, rate: 5}], "Sci Fi Fan": {...}, ...}

}

  

def base_cases(products_type):

    return ["empty_case"] + PRODUCT_CASES[products_type]

  

if(st.dropdown(base_cases(products_type))):

    transactions = base_cases(products_type)

  
  

st.write("Recommendation Engine: ", recommend_single_engine)

st.write("select prodcuts")

  

st.search_df(products)

  

st.multi_select("Select the products", products)

  

if (st.button("buy")):

    transaction = {

        "user_id": "user1",

        "product_id": st.session_state.selected_products,

        "rate": 5}

    transactions.extend(transaction)

    recommend = engines[recommend_single_engine].recommend_from_past(transactions)

  
  

# Show the recommendations

st.carousel(recommend)

  

# Show the user transaction historial

st.df(transactions)

  
  

```
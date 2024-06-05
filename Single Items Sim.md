


![](Pasted%20image%2020240512204239.png)

The library is there, but it doesn't seem to support it.


https://github.com/NicolasHug/Surprise/blob/c1de6b0e35726577e0625b2ed77688655610ad54/surprise/similarities.pyx

```python

def cosine(int n_x, yr, int min_support):
    """Compute the cosine similarity between all pairs of users (or items).

    Only **common** users (or items) are taken into account. The cosine
    similarity is defined as:
    ...
    """
    for xi in range(n_x):
        sim[xi, xi] = 1
        for xj in range(xi + 1, n_x):
            if freq[xi, xj] < min_sprt:
                sim[xi, xj] = 0
            else:
                denum = sqrt(sqi[xi, xj] * sqj[xi, xj])
                sim[xi, xj] = prods[xi, xj] / denum

            sim[xj, xi] = sim[xi, xj]

    return np.asarray(sim)
    
```

I guess the training could be simple by having a KNNBasic, with the specifics but then creating the recommendation purely on close members.



```
```


- Time to evaluate all scores of similitudes in match
- Statistically review

![](Pasted%20image%2020240513231147.png)

![](Pasted%20image%2020240513231214.png)

![](Pasted%20image%2020240513231405.png)

![](Pasted%20image%2020240513231545.png)
![](Pasted%20image%2020240513231628.png)
Is 150mb good?

![](Pasted%20image%2020240513231622.png)

![](Pasted%20image%2020240515145347.png)

Trying to understand here the issue0

- I think it might have to do whth the fact that the recommendation engine is blank. with the objects? or not find the releveant or any relevant transactions

```
	if len(relevant_transactions) <= 0:

		continue
```

![](Pasted%20image%2020240515150102.png)

Lets check:

It looks as:

```python
def train(self, auto_save=True, dont_save_self_state=False) :

	transactions = self.all_transactions_df

	self.similitudeRec.train(transactions)

	model = self.algorithm()

	reader = Reader(rating_scale=(1, 5))
```

,odel = self.algorithm()??

Here it seems as follows:

```python
  

class SimilutudeRecommender(KNNBasicRecommender):

    """

    Features trainning using KNN model but purely recommendations are purely based on cosine similarity.

    Supports Extending. Recommnedations (that can be used by other Recommender classes) to find neighbors.

    """

    strategy_name: str = "Similitude Recommender"

    slug_name: str = "simmilitude_recommender"

    version: str = "v1"

    details: str = "REQUIRES IMPLEMENTATION"

    link: str = "REQUIRES IMPLEMENTATION"

    supports_single_recommendation: bool = True

    supports_past_recommendation: bool = True

    sim_options = {"name": "pearson", "user_based": False}

    algorithm = KNNBasic

    def __init__(self, products: pd.DataFrame, product_data: dict, transactions = None):

        super().__init__(products, product_data)

        self.products = products

        self.model = None

        # Get the product ids and store them.

        self.product_ids = self.products['id'].unique()

        self.all_transactions_df = transactions

    def train(self, auto_save=True, dont_save_self_state=False):

        model = self.algorithm(sim_options=self.sim_options)

        transactions = self.all_transactions_df

        reader = Reader(rating_scale=(1, 5))
```

It doesnt even accept because is supposed to be intiialized there.

![](Pasted%20image%2020240515185433.png)

![](Pasted%20image%2020240515185442.png)


![](Pasted%20image%2020240516022513.png)


--------------------------------------------------------------------------- KeyError Traceback (most recent call last) Cell In[5], [line 44](vscode-notebook-cell:?execution_count=5&line=44) [42](vscode-notebook-cell:?execution_count=5&line=42) if len(recs) == 0: [43](vscode-notebook-cell:?execution_count=5&line=43) continue ---> [44](vscode-notebook-cell:?execution_count=5&line=44) recommendation_ids = [rec[0]['product_id'] for rec in recs] [45](vscode-notebook-cell:?execution_count=5&line=45) hit = 0 [46](vscode-notebook-cell:?execution_count=5&line=46) for rec in recommendation_ids: Cell In[5], [line 44](vscode-notebook-cell:?execution_count=5&line=44) [42](vscode-notebook-cell:?execution_count=5&line=42) if len(recs) == 0: [43](vscode-notebook-cell:?execution_count=5&line=43) continue ---> [44](vscode-notebook-cell:?execution_count=5&line=44) recommendation_ids = [rec[0]['product_id'] for rec in recs] [45](vscode-notebook-cell:?execution_count=5&line=45) hit = 0 [46](vscode-notebook-cell:?execution_count=5&line=46) for rec in recommendation_ids:



![](Pasted%20image%2020240516030550.png)

Why is it showing the wrong data here>

![](Pasted%20image%2020240516031620.png)
- Skip then. 


Product Counts

- Product counts are 0 on games. So I am checking here, if the case is that 

```bash

Start count of transactions 26024289 Unique books: 45115 Unique users: 270896 final count of transactions 25827368 Unique books: 19452 Unique users: 243354 ========== PRODUCT COUNTS ========== product_id 356 90133 318 89415 296 87685 593 82814 2571 76401 ... 149686 12 147144 12 165351 12 145388 12 101536 11 Name: count, Length: 19452, dtype: int64 ========== SORTED PRODUCT COUNTS ========== product_id count 0 356 90133 1 318 89415 2 296 87685 3 593 82814 4 2571 76401 ... ... ... 19447 149686 12 19448 147144 12 19449 165351 12 19450 145388 12 19451 101536 11 [19452 rows x 2 columns] {'data_context': 'movies', 'product_count': 0, 'product_features': ['product_id', 'product_title', 'product_image', 'product_price', 'product_soup', 'product_tags', 'product_rate', 'count', 'id'], 'product_filepath': 'data/products_movies_v2_t6_p12.csv', 'product_unique_count': 0, 'transaction_count': 25827368, 'transaction_features': ['id', 'user_id', 'product_id', 'rate'], 'transactions_filepath': 'data/transactions_movies_v2_t6_p12.csv', 'unique_name': '_movies_v2_t6_p12', 'version': '2'}
```


![](Pasted%20image%2020240518131044.png)



There is a t?

![](Pasted%20image%2020240518132931.png)


![](Pasted%20image%2020240518133900.png)

> Look at this. movies dataset seems to be just better.
























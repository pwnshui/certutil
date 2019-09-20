import os
import requests
from time import time as timer
#And now a function that streams a response into a local file:

def fetch_url(entry):
    path, uri = entry
    if not os.path.exists(path):
        r = requests.get(uri, stream=True)
        if r.status_code == 200:
            with open(path, 'wb') as f:
                for chunk in r:
                    f.write(chunk)
    return path
# Let’s download some web pages:

urls = [
    ("tmp/1.html", "https://markhneedham.com/blog/2018/07/10/neo4j-grouping-datetimes/"),
    ("tmp/2.html", "https://markhneedham.com/blog/2018/07/09/neo4j-text-cannot-be-parsed-to-duration/"),
    ("tmp/3.html", "https://markhneedham.com/blog/2018/06/15/neo4j-querying-strava-graph-py2neo/"),
    ("tmp/4.html", "https://markhneedham.com/blog/2018/06/12/neo4j-building-strava-graph/"),
    ("tmp/5.html", "https://markhneedham.com/blog/2018/06/05/neo4j-apoc-loading-data-strava-paginated-json-api/"),
    ("tmp/6.html", "https://markhneedham.com/blog/2018/06/03/neo4j-3.4-gotchas-working-with-durations/"),
    ("tmp/7.html", "https://markhneedham.com/blog/2018/06/03/neo4j-3.4-formatting-instances-durations-dates/"),
    ("tmp/8.html", "https://markhneedham.com/blog/2018/06/02/neo4j-3.4-comparing-durations/"),
    ("tmp/9.html", "https://markhneedham.com/blog/2018/05/19/interpreting-word2vec-glove-embeddings-sklearn-neo4j-graph-algorithms/"),
    ("tmp/10.html", "https://markhneedham.com/blog/2018/05/11/node2vec-tensorflow/")
]

start = timer()
for entry in urls:
    fetch_url(entry)

print(f"Elapsed Time: {timer() - start}")

#Elapsed Time: 2.0800578594207764
#Great! That code does the job but how do we parallelise it?

#I came across a neat approach in a StackOverflow reply which can be plugged into my existing code really easily. We’ll use the multiprocessing library to help us out so let’s get that imported:

from multiprocessing.pool import ThreadPool
#And now we create a thread pool and then call out to our fetch_url function with the list of URLs that we created earlier on:

results = ThreadPool(8).imap_unordered(fetch_url, urls)
for path in results:
    print(path)

print(f"Elapsed Time: {timer() - start}")


import pandas as pd
from time import sleep
import uuid

print("Initiating stress test")
dfs = [
    pd.read_csv("dataset.csv")
    for i in range(500)
]

print("Data ingested correctly")
counter = 0

print("Generating more random data")
while True:
    print("counter: %s" % str(counter))
    sleep(5)
    counter += 1
    for df in dfs:
        df[str(counter)] = [str(uuid.uuid4()) for i in range(df.shape[0])]

    print(dfs)

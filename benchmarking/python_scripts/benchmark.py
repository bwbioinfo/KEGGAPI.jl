import Bio.KEGG.REST as BK
import timeit

def test_info():
    BK.kegg_info("KEGG")

# Measure the time taken by my_function to execute
execution_time = timeit.timeit(test_info, number=15)
print(f"Execution time: {execution_time:.5f} seconds")

def test_get():
    BK.kegg_get("hsa:10458")

# Measure the time taken by my_function to execute
execution_time = timeit.timeit(test_get, number=15)
print(f"Execution time: {execution_time:.5f} seconds")
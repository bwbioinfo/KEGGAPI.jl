# Example 3: 

#  - input: Compound of interest
#  - output style: 
#     - table to file (csv/tsv/excel) 
#     - pathway figure (this is an option we won't show the actual figure otherwise we need to ask for copyrigth permission)

# 1.- If compound in KEGG get name(s), molecular mass, weight, formula, id in other db
# 2.- Identify reaction(s) in which the compound is either substrate or product of such reaction (name, reaction schema, EC number)
# 3.- Get pathway(s) associated to the reaction(s)
# 4.- Get genes associated to either the reaction of interest or the pathways. 

my_compound = "protocatechuate"
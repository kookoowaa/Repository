import networkx as nx
import matplotlib.pyplot as plt
G = nx.Graph()

G.add_node('Tony')
G.add_nodes_from(['Johny','Jake','Jane','Eva','Patrick'])

G.add_edge('Tony','Jane')
G.add_edges_from([('Johny','Jane'),('Eva','Patrick'),('Jake','Patrick')])

label_dict={}
for node in G.nodes():
    label_dict[node] = node

nx.draw(G, node_size = 800, labels = label_dict, with_labels = True)
plt.show()
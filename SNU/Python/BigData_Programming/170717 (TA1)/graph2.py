import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()

G.add_node('Amsterdam')
G.add_nodes_from(['Amsterdam','Berlin','Brussels','Paris','Frankfurt','Prague','Geneva','Munich','Grenoble','Florence'])

G.add_edge('Amsterdam','Berlin', length = 690)
G.add_edges_from([('Berlin','Prague', 380),('Prague','Frankfurt', 530),('Frankfurt','Brussels', 405),('Brussels','Amsterdam', 205),
                  ('Brussels','Paris'),('Paris','Geneva'),('Geneva','Grenoble'),('Grenoble','Milan'),
                  ('Milan','Geneva'),('Geneva','Frankfurt'),('Milan','Florence'),('Florence','Munich'),
                  ('Munich','Milan'),('Munich','Prague')])

label_dict={}
for node in G.nodes():
    label_dict[node] = node

nx.draw(G, node_size = 200, labels = label_dict, with_labels = True)

plt.show()
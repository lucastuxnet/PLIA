####################################################################
#algoritmo_a_estrela.py
#
# Trabalho 3 da disciplina de PLIA
#
#DDA 17.12.2020
#
#DESC: Programa feito em python para solução de melhor rota do mapa
#      simplificado de uma viagem entre Uberlândia até São Paulo através
#      de um algoritmo busca heuristica A-estrela. As cidades partida e alvo
#      são definidas pelas variavéis Node_Inicio e Node_Fim respectivamente.
#
#ALUNO: Lucas Albino Martins - Matricula: 12011ECP022
#
######################################################################

from copy import deepcopy
from matplotlib import pyplot
from numpy import random

# Declaração de classes.

class Node():
	# Classe que representa um nó (cidade).

	def __init__(self, nome_cidade, valor_heuristico):
		self.cidade = nome_cidade
		self.heuristica = valor_heuristico
		self.vizinhos = []

	def __init__(self, nome_cidade, coordenada):
		self.cidade = nome_cidade
		self.coordenada = coordenada
		self.heuristica = 0
		self.vizinhos = []

	def gera_heuristica(self, Node_alvo):
		self.heuristica = ((self.coordenada[0] - Node_alvo.coordenada[0])**2 + (self.coordenada[1] - Node_alvo.coordenada[1])**2)**0.5

	def get_heuristica(self):
		return self.heuristica

	def get_coordenada(self):
		return self.coordenada

	def __str__(self):
		return self.cidade

class Edge():
	# Classe que representa os Nós filhos (cidades vizinhas).

	def __init__(self, node_alvo, valor_custo):
		self.node = node_alvo
		self.distancia = valor_custo

	def custo(self):
		return self.distancia + self.node.heuristica

class Route():

	def __init__(self, Node_Inicial):
		self.distancias = 0
		# Nodes avaliados.
		self.nodes = [Node_Inicial]
		# Nodes ainda não avaliados.
		self.ramos = Node_Inicial.vizinhos

	def custo_ramos(self):
		custo_ramos = []
		for ramo in self.ramos:
			custo_ramos.append(self.distancias + ramo.custo())

		return custo_ramos

	def adiciona(self, Ramo):
		self.distancias += Ramo.distancia
		self.nodes.append(Ramo.node)
		self.ramos = Ramo.node.vizinhos

	def retira(self, Ramo):
		for ramo in self.ramos:
			if(ramo.node.cidade == Ramo.node.cidade):
				self.ramos.remove(ramo)

	def __str__(self):
		nodes = ""
		for node in self.nodes:
			nodes += " -> {}".format(node)
		return "{} - {}".format(nodes, self.distancias)



def Uberlandia_SaoPaulo():

	# Inicializando cidades.
	# Os valores Heuristicos são dados de acordo com a distância em linha reta de Uberlândia.
	# Os nós recebem o nome da cidade e as coordenadas geográficas da cidade.
    # Os valores das coordenadas geográficas de cada cidade são ficticios.
    
	Ribeirao_Preto = Node("Ribeirao_Preto", [0, 0])
	Campinas = Node ("Campinas", [255.3, 142])
	Piracicaba = Node("Piracicaba", [214.5, -58])
	Araxa = Node("Araxa", [-210, 293.5])
	Rio_Claro = Node("Rio_Claro", [180.7, 21.2])
	Patrocinio = Node("Patrocinio", [-281.2, 303.6])
	Sao_Paulo = Node("Sao_Paulo", [229, 230])
	Jaboticabal = Node("Jaboticabal", [-37, -82.1])
	Uberlandia = Node("Uberlandia", [-325, 242.5])
	Pirassununga = Node("Pirassununga", [82.6, 20])
	Franca = Node("Franca", [-132.7, 164])
	Uberaba = Node("Uberaba", [-230, 140.7])
	Guara = Node("Guara", [-182.7, 76.5])
	Barretos = Node("Barretos", [-180, -70])
	Colombia = Node("Colombia", [-300, -63])
	Planura = Node("Planura", [-292, 11.7])
	Santos = Node("Santos", [146.5, 258.2])
	Frutal = Node("Frutal", [-296, 81.6])
	Prata = Node("Prata", [-388.7, 142.8])
	Orlandia = Node("Orlandia", [-93.6, 37.9])


	# Cidades de partida e destino.
	Node_Inicio = Uberlandia
	Node_Fim = Sao_Paulo

	Nodes = [Ribeirao_Preto, Campinas, Piracicaba, Orlandia, Frutal, Araxa, Rio_Claro, Patrocinio, Sao_Paulo, Jaboticabal, Uberlandia, Pirassununga, Franca, Uberaba, Guara, Barretos, Colombia, Planura, Santos, Prata]

	# Monta a heuristica de acordo com a cidade destino.
	for node in Nodes:
		node.gera_heuristica(Node_Fim)
		print("{} - {}".format(node.cidade, node.get_heuristica()))

	# Inicializando vizinhos.
	Uberlandia.vizinhos = [Edge(Patrocinio, 75), Edge(Uberaba, 140), Edge(Prata, 118)]
	Patrocinio.vizinhos = [Edge(Araxa, 71), Edge(Uberlandia, 75)]
	Araxa.vizinhos = [Edge(Patrocinio, 71), Edge(Uberaba, 151)]
	Uberaba.vizinhos = [Edge(Araxa, 151), Edge(Uberlandia, 140), Edge(Franca, 99), Edge(Guara, 80)]
	Franca.vizinhos = [Edge(Uberaba, 99), Edge(Ribeirao_Preto, 211)]
	Guara.vizinhos = [Edge(Uberaba, 80), Edge(Orlandia, 97), Edge(Barretos, 146)]
	Orlandia.vizinhos = [Edge(Guara, 97), Edge(Ribeirao_Preto, 101), Edge(Barretos, 138)]
	Prata.vizinhos = [Edge(Uberlandia, 118), Edge(Frutal, 111)]
	Frutal.vizinhos = [Edge(Prata, 111), Edge(Planura, 70)]
	Planura.vizinhos = [Edge(Frutal, 70), Edge(Colombia, 75)]
	Colombia.vizinhos = [Edge(Planura, 75), Edge(Barretos, 120)]
	Barretos.vizinhos = [Edge(Colombia, 120), Edge(Guara, 146), Edge(Orlandia, 138)]
	Ribeirao_Preto.vizinhos = [Edge(Franca, 211), Edge(Orlandia, 101), Edge(Jaboticabal, 90), Edge(Pirassununga, 85)]
	Jaboticabal.vizinhos = [Edge(Ribeirao_Preto, 90)]
	Pirassununga.vizinhos = [Edge(Ribeirao_Preto, 85), Edge(Rio_Claro, 98), Edge(Campinas, 142)]
	Rio_Claro.vizinhos = [Edge(Pirassununga, 98), Edge(Piracicaba, 86)]
	Piracicaba.vizinhos = [Edge(Rio_Claro, 86)]
	Campinas.vizinhos = [Edge(Pirassununga, 142), Edge(Sao_Paulo, 92)]
	Sao_Paulo.vizinhos = [Edge(Campinas, 92), Edge(Santos, 87)]
	Santos.vizinhos = [Edge(Sao_Paulo, 87)]

	plot_cidades(Nodes)

	# Calculando a rota.
	Solucao = Rota(Node_Inicio, Node_Fim)
	
	# Plota a melhor solução.
	x = []
	y = []
	for node in Solucao:
		x.append(node.get_coordenada()[0])
		y.append(node.get_coordenada()[1])

	pyplot.plot(x, y, '-', color = 'red', lw=2)
	plot_cidades(Nodes)
	

def Rota(Node_Inicio, Node_Fim):

	if(Node_Fim.cidade == Node_Inicio.cidade):
		return [Node_Inicio]

	Fila_De_Rotas = []

	rota = Route(Node_Inicio)
	Fila_De_Rotas.append(rota)


	while(True):
		melhores_ramos = []
		melhor_ramo = None

		index_melhores_ramos = []
		rota_com_melhor_ramo = None
		
		# Encontra o melhor ramo entre os ramos abertos.
		for rota in Fila_De_Rotas:
			custo_ramos = rota.custo_ramos()
			melhores_ramos.append(min(custo_ramos))
			index_melhores_ramos.append(custo_ramos.index(min(custo_ramos)))

		indice_melhor_rota = melhores_ramos.index(min(melhores_ramos))
		rota_com_melhor_ramo = deepcopy(Fila_De_Rotas[indice_melhor_rota])
		melhor_ramo = rota_com_melhor_ramo.ramos[index_melhores_ramos[indice_melhor_rota]]
	
		# Remove ramo da rota antiga.
		rota = Fila_De_Rotas[indice_melhor_rota]
		rota.retira(melhor_ramo)
		
		rota_com_melhor_ramo.adiciona(melhor_ramo)
		Fila_De_Rotas.append(rota_com_melhor_ramo)

		# Adiciona uma nova rota ou remove uma rota que já acabou.
		if(len(rota.ramos) == 0):
			Fila_De_Rotas.remove(rota)	

		# Condição de Uberlandia para São Paulo.
		print(rota_com_melhor_ramo)
		if(melhor_ramo.node.cidade == Node_Fim.cidade):
			break;

	return rota_com_melhor_ramo.nodes
	
def plot_cidades(Nodes):

	coordenadas_x = []
	coordenadas_y = []
	for node in Nodes:
		coordenadas_x.append(node.get_coordenada()[0])
		coordenadas_y.append(node.get_coordenada()[1])

	colors = random.rand(len(coordenadas_x))

	x = [-210, -281.2, -325, -388.7, -296, -292, -300, -180, -182.7, -230, -210]
	y = [293.5, 303.6, 242.5, 142.8, 81.6, 11.7, -63, -70, 76.5, 140.7, 293.5]
	pyplot.plot(x, y, ':', color = 'black', lw=1)

	x = [-325, -230, -132.7, 0, -93.6, -182.7]
	y = [242.5, 140.7, 164, 0, 37.9, 76.5]
	pyplot.plot(x, y, ':', color = 'black', lw=1)

	x = [-180, -93.6]
	y = [-70, 37.9]
	pyplot.plot(x, y, ':', color = 'black', lw=1)

	x = [-37, 0, 82.6, 180.7, 214.5]
	y = [-82.1, 0, 20, 21.2, -58]
	pyplot.plot(x, y, ':', color = 'black', lw=1)

	x = [82.6, 255.3, 229, 146.5]
	y = [20, 142, 230, 258.2]
	pyplot.plot(x, y, ':', color = 'black', lw=1)

	pyplot.scatter(coordenadas_x, coordenadas_y, marker="o", c=colors, alpha=0.5)

	for node in Nodes:
		pyplot.annotate(node.cidade, xy = (node.get_coordenada()[0], node.get_coordenada()[1]))

	pyplot.show()




Uberlandia_SaoPaulo()
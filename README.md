# -Lighthouse-Desafio-Ci-ncia-de-Dados-2024-9
Olá pessoal! 
Resposta da questão 4: 95.10
Para utilizar o projeto é preciso ter o arquivo modelo_IMDB.pkl, definir uma localização para o arquivo no sseu diretório 
Rodar a seguinte célula lembrando de atualizar a localização do arquivo e as informação do filmes que você deseja predizer a nota do IMDB
import pandas as pd
import joblib

# Carregar o modelo treinado
with open("modelo_imdb.pkl", 'rb') as file:
    model = joblib.load(file)

# Exemplo de dados para previsão (substitua com seus próprios dados)
dados_para_previsao = pd.DataFrame( {'Released_Year': [1994],
    'Certificate': ['A'],
    'Runtime': [142],
    'Genre_1': ['Drama'],
    'Meta_Score': [80.0],
    'Director': ['Frank Darabont'],
    'Star1': ['Tim Robbins'],
    'Star2': ['Morgan Freeman'],
    'Star3': ['Bob Gunton'],
    'Star4': ['William Sadler'],
    'No_of_Votes': [2343110],  
    'Gross': [28341469] 
})

# Realizar a previsão
X_predicao = preprocessor.transform(dados_para_previsao)
y_pred = model.predict(X_predicao)

# Exibir a previsão
print(f'A previsão de nota do IMDB para o filme é: {y_pred[0]:.2f}')

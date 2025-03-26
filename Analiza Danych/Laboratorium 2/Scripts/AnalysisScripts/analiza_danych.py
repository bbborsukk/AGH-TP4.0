import pandas as pd
import matplotlib.pyplot as plt

df_dogs = pd.read_csv('Data\AnalysisData\dogs_cleaned.csv', index_col = 0)


grouped_dogs_weight = df_dogs.groupby('Breed')['Weight (kg)'].agg(['max', 'mean'])
sorted_dogs_weight = grouped_dogs_weight.sort_values(by='max', ascending=False)
print('\nPosortowane rasy psów ze względu na wagę\n')
print(sorted_dogs_weight)

#znalezenie najcięższej rasy psa
heaviest_breed = sorted_dogs_weight.index[0]
heaviest_weight = sorted_dogs_weight['max'].iloc[0]
mean_heaviest_weight = sorted_dogs_weight['mean'].iloc[0]

print(f'\nNajcięższą rasą psa jest {heaviest_breed} z masą maksymalną {heaviest_weight} i z masą średnią {mean_heaviest_weight}')

#Tworzenie wizualizacji
chart_weight = grouped_dogs_weight.plot(kind='bar')
chart_weight.set_xlabel('Rasa')
chart_weight.set_ylabel('Waga(kg)')
chart_weight.set_title('Maksymalna i średnia waga psów według rasy')
plt.legend(['Maksymalna waga', 'Średnia waga'])
plt.tight_layout()
plt.show()

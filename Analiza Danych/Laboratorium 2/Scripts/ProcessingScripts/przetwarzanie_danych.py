#Zaimportowanie potrzebnych bibliotek
import pandas as pd
from datetime import date

#Sprawdzenie bazy danych
print('Sprawdzenie wyświetlania się bazy danych\n')
dogs = pd.read_csv('Data\InputData\dogs.csv')
print(dogs.head())

#Poprawne wczytanie bazy danych
print('\nPoprawne wczytanie bazy danych\n')
df_dogs = pd.read_csv('Data\InputData\dogs.csv', sep=';')
print(df_dogs.head())

#Wyświetlenie podstawowych informacji o danych
print('\nPodstawowe informacje o DataFrame\n')
print(df_dogs.info())
print('\nWygenerowane statystyki opisowe dla danych\n')
print(df_dogs.describe())

#Czyszczenie danych, usunięcie pustych wierszych, naprawienie indeksowania
df_dogs = df_dogs.dropna()
df_dogs = df_dogs.reset_index(drop=True)
df_dogs.index += 1
df_dogs.columns = df_dogs.columns.str.strip()
print('\nWyświetlenie wyczyszczonej bazy danych\n')
print(df_dogs.head())


#Dodanie kolumny wiek
df_dogs['Date of Birth'] = pd.to_datetime(df_dogs['Date of Birth'], dayfirst = True)
current_date = pd.to_datetime(date.today())
df_dogs["Dog's age"] = (current_date - df_dogs['Date of Birth'])


#Filtracja danych
print('\nPsy, które waża więcej niż 20kg i są wyższe niż 50 cm\n')
print(df_dogs[(df_dogs['Weight (kg)'] > 20) & (df_dogs['Height (cm)'] > 50)])


#Grupowanie danych
print('\nWyświetlenie średniej wagi i wzrostu psa według rasy psa\n')
print(df_dogs.groupby('Breed')[['Weight (kg)', 'Height (cm)']].mean())


#Usunięcie zbędnych kolumn
df_dogs_cleaned = df_dogs.drop(labels=['Name','Color','Date of Birth'], axis=1)

#Sprawdzenie czy nie ma odstających wyników lub wypaczających wynik jak np. niedawno urodzony szczeniak
print('\nPodstawowe informacje o wieku\n')
print(df_dogs_cleaned.groupby('Breed')["Dog's age"].agg(['min', 'max', 'mean', 'sum']))

print('\nPodstawowe informacje o wzroście\n')
print(df_dogs_cleaned.groupby('Breed')["Height (cm)"].agg(['min', 'max', 'mean', 'sum']))

print('\nPodstawowe informacje o wadze\n')
print(df_dogs_cleaned.groupby('Breed')["Weight (kg)"].agg(['min', 'max', 'mean', 'sum']))

#Po upewnieniu, że dane są prawidłowe. Usuwamy kolumne z wiekiem i eksportujemy dane
df_dogs_cleaned = df_dogs_cleaned.drop(labels=["Dog's age","Height (cm)"], axis=1)
df_dogs_cleaned.to_csv('Data\AnalysisData\dogs_cleaned.csv')


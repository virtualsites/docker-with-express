# zjakiego onbrazu budujemy nasz obraz
FROM node:10
#tworzymy katalog node_modules i nadajemy mu prawa dostępu
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
#ustawiamy bierzący karalog roboczy
WORKDIR /home/node/app
# i kopiujemy do niego plik package.json
COPY package*.json ./
#instalujemy zależności naszego projektu
RUN npm install
#i kopiujemy wszystkie pozostałe pliki
COPY . .
# dbamy o dostęp do poszczególnych katalogów
COPY --chown=node:node . .
# zmieniamy użytkownika
USER node
#określamy na jakim porcie działa nasza aplikacja
EXPOSE 8080
# z pomocą node uruchamiamy serwer
CMD ["node", "app.js"]

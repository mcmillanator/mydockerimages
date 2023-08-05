# FoundryVtt Docker Image
## Quick start
### Build
1. Copy the timed URL from the foundryvtt website (here)[https://foundryvtt.com/community/keldari/licenses]
2. docker build --build-arg TIMED_URL="PASTE_TIMED_URL_HERE" -t mcmillanator/foundryvtt .
3. tag with the downloaded version `docker tag mcmillanator/foundryvtt mcmillanator/foundryvtt:v10.291`
4. push to docker hub `docker push mcmillanator/foundryvtt`
### Run
`docker run -d --name foundry -v foundrydata:/foundrydata --rm -p 30000:30000 foundryvtt`
## Docs
* Install instructions https://foundryvtt.com/article/installation/
* Download link https://foundryvtt.com/community/keldari/licenses
## Ports
30000
80
443

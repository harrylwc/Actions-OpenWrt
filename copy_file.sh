#curl -i -X POST r619ac.ubddns.org:8080/store.json --data-binary "@"$1
curl -X POST http://r619ac.ubddns.org:8080/upload -F 'files=@'$1

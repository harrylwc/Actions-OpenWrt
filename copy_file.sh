#curl -i -X POST be6500.ubddns.org:8080/store.json --data-binary "@"$1
curl -X POST http://be6500.ubddns.org:8080/upload -F 'files=@'$1

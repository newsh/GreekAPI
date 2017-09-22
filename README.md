# GreekApi   :trident:

This Web API will let you query information from Greek Mythology. Currently features ~150 characters, which is about 5% upon completion.

### Commands
This API can be used via HTTP protocol. Send a GET request to any of the paths below. You will receive a JSON response.

| URL | Description |
| ------ | ------ |
| **/person/\<lang\>/:name**<br>lang:<br>(required)<br>'de' or 'en'| Retrieve data for specified person|
| **/person/getAll** *\<+params\>*<br>URL params:<br>(optional)<br>lang=[de\|en]<br>gender=[male\|female] | Retrieve list of all available persons|
| **/person/random** *\<+params\>*<br>URL params:<br>(optional)<br>lang=[de\|en]<br>gender=[male\|female] | Retrieve random person's data |
|

#### 1. Examples

1.1 Request: Information about Zeus with english localization

``https://anfi.tk/greekApi/person/en/Zeus``

Response:
```
{
   "personID": 1,
   "name": "zeus",
   "mother": {
      "personID": 69,
      "name": "Rhea"
   },
   "father": {
      "personID": 70,
      "name": "Cronos"
   },
   "wife": [
      {
         "personID": 67,
         "name": "Hera"
      }
   ],
   "son": [
      {
         "personID": 29,
         "name": "Dionysus"
      },
      {
         "personID": 40,
         "name": "Aeacus"
      },
      {
         "personID": 60,
         "name": "Tantalus"
      },
      {
         "personID": 66,
         "name": "Ares"
      },
      {
         "personID": 108,
         "name": "Heracles"
      }
   ],
   "daughter": [
      {
         "personID": 65,
         "name": "Aphrodite"
      },
      {
         "personID": 133,
         "name": "Hebe"
      }
   ],
   "status": "OK"
}
```

1.2 Request: Random female person with german localization

``` https://anfi.tk/greekApi/person/random?lang=de&gender=female ```

Response:
```
{
   "personID": 33,
   "name": "Krëusa",
   "husband": [
      {
         "personID": 32,
         "name": "Xuthos"
      }
   ],
   "son": [
      {
         "personID": 34,
         "name": "Ion"
      }
   ],
   "status": "OK"
}
```

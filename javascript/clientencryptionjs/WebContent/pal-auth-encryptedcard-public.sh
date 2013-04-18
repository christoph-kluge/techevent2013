
-------------------- API INTEGRATION ----------------------------


# Submit charge 

curl --user 'username:password' https://pal-test.adyen.com/pal/adapter/httppost \
 --data-urlencode 'action=Payment.authorise' \
 --data-urlencode 'paymentRequest.amount.currency=EUR' \
 --data-urlencode 'paymentRequest.amount.value=1234' \
 --data-urlencode 'paymentRequest.merchantAccount=YourAccountCode' \
 --data-urlencode 'paymentRequest.reference=Example Order 1' \
 --data-urlencode 'paymentRequest.additionalData.card.encrypted.json=adyenjs_0_1_0$eGcJxidHkg5LYQXuPQBgQqjI1poQ639yBUs2R25iqT/Mz0c7x4Vyyg0+6I2ZOTcY/6M8ahjLvOEb2k5RECiorC0jDzGtzL3ohIj2LFpx1ZXahIc5pA2Q1dER9N/vMYOAR3yE2Iq6/4QUpDKm/z0LgGOKy2BM1o0K5eBQwDrlocIcYJz8fOY6OkcIJmlpBMG4y8jg9BVhvDA7UoTD3IaSrKkCI2I7TAGb0Dqu+wHO0/NJJrkegPJMkL2W75Z9hCzlt5fX/SINrjSxnDJKJVnao8myq3D+wc4G5nhKJZSNG/A7B7r4We6KVMdpsGZmawLUX8fOWR2TO5WJe0HDMnuyag==$0fpncCM2dLxCp0LZjD3X9K+OekAV2c80Vph4vIHoCZ/6xX3OE6+XUtcTxHQiyQKcwm111+B+K/lNyE3WxrNp4lssOsI3q5MsLvroiITSWiJEyGlNGGSyeGu7729EXJemE1GQAdyBuO+GqQsdjA7QDPeuH6LUio9RipqyTBu11MJIC+rlMYxituYCT7A9yDeF2Rlv2I56KOAap66tTm2uZkto4PKRW4YCA8dZYQ=='



# Submit intial charge and store customer

curl --user 'username:password' https://pal-test.adyen.com/pal/adapter/httppost \
 --data-urlencode 'action=Payment.authorise' \
 --data-urlencode 'paymentRequest.amount.currency=EUR' \
 --data-urlencode 'paymentRequest.amount.value=1234' \
 --data-urlencode 'paymentRequest.merchantAccount=YourAccountCode' \
 --data-urlencode 'paymentRequest.reference=Example Order 1' \
 --data-urlencode 'paymentRequest.recurring.contract=RECURRING' \
 --data-urlencode 'paymentRequest.shopperReference=user123' \
 --data-urlencode 'paymentRequest.shopperEmail=john.doe@example.com' \
 --data-urlencode 'paymentRequest.additionalData.card.encrypted.json=adyenjs_0_1_0$kj7nlobE1rlC2etyjknEsTlEusTuouqlAmcjneE8I4716MU12I6Ho3CApD1w1/pzIqPaQFOgncYtWlqixsuvbkOk6wBVOtQc0/hcgi7iU/Ft/upAiuFMDtg6R5PPWJD2xSH08dxClKlOLc2T2V8V8w+zzYIHqbmXEvm4tRxpqNQ=$SFNi0iEkbioLMz5Tx2SgN2/5GyZvGlbRYuKT3nElwUkHIi219S1ixF23GkIGf0FL2fXM8efanRt6mvxk4EEvtiPdvly9PkOCa76y7zcfZanA5YSz4ikdUF+jV1JKuTG72Wm4qt3Lsad5lZenXbMMcSxiaE/cY878H+Op'

-------------------------
paymentResult.authCode=98356
paymentResult.pspReference=9913642236790892
paymentResult.resultCode=Authorised
-------------------------

# List recurring details/cards 

curl --user 'username:password' https://pal-test.adyen.com/pal/adapter/httppost \
 --data-urlencode 'action=Recurring.listRecurringDetails' \
 --data-urlencode 'recurringDetailsRequest.merchantAccount=YourAccountCode' \
 --data-urlencode 'recurringDetailsRequest.recurring.contract=RECURRING' 
 --data-urlencode 'recurringDetailsRequest.shopperReference=user123' \
 --data-urlencode 'recurringDetailsRequest.shopperEmail=john.doe@example.com' \

-------------------------
recurringDetailsResult.shopperReference=user123
recurringDetailsResult.creationDate=2013-03-25T13:23:14+01:00
recurringDetailsResult.lastKnownShopperEmail=john.doe@example.com
recurringDetailsResult.details.0.variant=mc
recurringDetailsResult.details.0.recurringDetailReference=9913642141960010
recurringDetailsResult.details.0.creationDate=2013-03-25T13:23:16+01:00
recurringDetailsResult.details.0.card.number=1111
recurringDetailsResult.details.0.card.expiryMonth=6
recurringDetailsResult.details.0.card.expiryYear=2016
recurringDetailsResult.details.0.card.holderName=John Doe
-------------------------

# Submit recurring charge

curl --user 'username:password' https://pal-test.adyen.com/pal/adapter/httppost \
 --data-urlencode 'action=Payment.authorise' \
 --data-urlencode 'paymentRequest.amount.currency=EUR' \
 --data-urlencode 'paymentRequest.amount.value=1234' \
 --data-urlencode 'paymentRequest.merchantAccount=YourAccountCode' \
 --data-urlencode 'paymentRequest.reference=Example Order 2' \
 --data-urlencode 'paymentRequest.shopperReference=user123' \
 --data-urlencode 'paymentRequest.shopperEmail=john.doe@example.com' \
 --data-urlencode 'paymentRequest.shopperInteraction=ContAuth' \
 --data-urlencode 'paymentRequest.recurring.contract=RECURRING' \
 --data-urlencode 'paymentRequest.selectedRecurringDetailReference=9913642141960010' 

-------------------------
paymentResult.authCode=75682
paymentResult.pspReference=9913642244711617
paymentResult.resultCode=Authorised
-------------------------







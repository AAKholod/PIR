#Характеристики нового питомца
$Body=@{
    id = 117
    category = @{
        id = 47
        name = "BlackWidow"
    }
    name = "Natasha"
    photoUrls = @(
        "string"
    )
    tags = @(
        @{
            id = 0
            name = "string"
        }
    )
    status = "available"
}

#Добавление такого питомца
$JsonBody = $Body | ConvertTo-Json
Set-Variable Uri -Value "https://petstore.swagger.io/v2/pet"
Invoke-RestMethod -ContentType "application/json" -Uri $Uri -Method Post -Body $JsonBody

#Вывести данны по питомцу 117
Invoke-RestMethod -Method GET -ContentType "application/json" -Uri "https://petstore.swagger.io/v2/pet/117"
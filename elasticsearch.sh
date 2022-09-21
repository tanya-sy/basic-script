###修改索引副本数
curl -X PUT "localhost:9200/$a/_settings" -H 'Content-Type: application/json' -d'
{
    "number_of_replicas": 0
}
'


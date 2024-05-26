import axios from "axios";

window.axios = axios
axios.defaults.withCredentials = false
// axios.defaults.baseURL = "http://localhost:8081/api"

axios.defaults.baseURL = process.env.VUE_APP_ROOT_API

////docker compose
//let backendUrl = "http://" + window.location.hostname.toString() + ":8888/api"

//eks ingress without /ingress backend
//let backendUrl = "http://backend-service.restaurant/api" //cannot spin up website at all
//let backendUrl = "http://backend-service.restaurant:8888/api" //website ok but cannot connect to backend
//let backendUrl = "http://backend-service.restaurant.svc.cluster.local"  //cannot spin up website at all
//let backendUrl = "http://backend-service.restaurant.svc.cluster.local:8888/api" //cannot spin up website at all
//

//with eks ingress backedn
//let backendUrl = "http://" + window.location.hostname.toString() + "/api/v1"  //no website
//let backendUrl = "http://" + window.location.hostname.toString() + ":8888/api/v1" //no website


//let backendUrl = "http://ce5-group2-food.sctp-sandbox.com/api/v1" //ok
//


//let backendUrl = window.location.protocol + '//' + window.location.hostname +
// (window.location.port ? ':' + window.location.port : '') + '/api'

//axios.defaults.baseURL = backendUrl

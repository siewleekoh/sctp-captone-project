import axios from "axios";

window.axios = axios
axios.defaults.withCredentials = false
// axios.defaults.baseURL = "http://localhost:8081/api"
//let backendUrl = "http://" + window.location.hostname.toString() + ":8888/backend/api"
let backendUrl = "http://" + window.location.hostname.toString() + "/backend/api"
axios.defaults.baseURL = backendUrl

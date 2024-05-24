// import express 
import express from "express";
// import functions from controller 
import {
    showFoods,
    showFoodById,
    createFood,
    updateFood,
    deleteFood,
} from "../controllers/food.js";

import {
    showAUser,
    createAccount
} from "../controllers/user.js";

import {
    addItems,
    getItem,
    updateItem,
    allItems,
    deleteItem,
    deleteItems
} from "../controllers/cart.js";

import {
    createBooking
} from "../controllers/booktable.js";

import {
    createBillDetails,getBillDetailsById
} from "../controllers/billdetails.js";

import {
    showNewestStatusId,
    createBillStatus, 
    getAllBillsByUser,
    getAllBillsByBill,
    getAllBills,
    updateBillStatus,
    updateBillPaid,
    cancelBillStatus
} from "../controllers/billstatus.js";

// init express router
const router = express.Router();

////////////////////////// FOOD ////////////////////////////////
// get all Food
router.get("/backend/api/foods", showFoods);

// get single Food 
router.get("/backend/api/foods/:id", showFoodById);

// create Food
router.post("/backend/api/foods", createFood);

// update Food 
router.put("/backend/api/foods/:id", updateFood);

// delete Food
router.delete("/backend/api/foods/:id", deleteFood);



////////////////////////// USER ////////////////////////////////
// get all user
router.get("/backend/api/users/:email", showAUser);

// create account
router.post("/backend/api/users/", createAccount);



////////////////////////// CART ////////////////////////////////
// add to cart
router.post("/backend/api/cartItem", addItems);

// get a item in cart
router.get("/backend/api/cartItem/:user_id/:food_id", getItem);

// get all items by user id
router.get("/backend/api/cartItem/:id", allItems);

// update item qty
router.put("/backend/api/cartItem/", updateItem);

// delete a item in cart
router.delete("/backend/api/cartItem/:user_id/:food_id", deleteItem);

// delete all items in cart
router.delete("/backend/api/cartItem/:id", deleteItems);



////////////////////////// Booking ////////////////////////////////
router.post("/backend/api/booking", createBooking);



////////////////////////// Bill Details ////////////////////////////////
router.post("/backend/api/billdetails", createBillDetails);
router.get("/backend/api/billdetails/:id", getBillDetailsById);



////////////////////////// Bill Status ////////////////////////////////
router.get("/backend/api/billstatus/new", showNewestStatusId);
router.post("/backend/api/billstatus", createBillStatus);
router.get("/backend/api/billstatus/user/:id", getAllBillsByUser);
router.get("/backend/api/billstatus/bill/:id", getAllBillsByBill);
router.get("/backend/api/billstatus", getAllBills);
router.put("/backend/api/billstatus/:id", updateBillStatus);
router.put("/backend/api/billstatus/paid/:id", updateBillPaid);
router.put("/backend/api/billstatus/cancel/:id", cancelBillStatus);





// export default router
export default router;









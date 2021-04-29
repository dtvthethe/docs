import { createStore } from "redux";

// 1. Đăng kí reducer: reducer có tác dụng biến đổi state cũ sang state mới.
const myReducer = (state = 0, action) => {
  switch (action.type) {
    case "UP":
      return state + 1;
    case "DOWN":
      return state - 1;
    default:
      return state;
  }
};

// 2. Đăng kí store: 1 store bao gồm subscribe, dispatch, getState
const store = createStore(myReducer);

// subscribe: lắng nghe bất kì sự thay đổi nào của store 
store.subscribe(() => {
  console.log(store.getState());
});

// 3: dispatch action
store.dispatch({ type: "UP" }); // 1
store.dispatch({ type: "UP" }); // 2
store.dispatch({ type: "UP" }); // 3
store.dispatch({ type: "UP" }); // 4
store.dispatch({ type: "DOWN" }); // 3

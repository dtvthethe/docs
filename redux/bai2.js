import { createStore } from "redux";

// ---------------------utilities-------------------------------

const renderList = (todos = []) => {
  const ulElement = document.querySelector("#todoList");
  ulElement.innerHTML = null;

  todos.forEach((todo) => {
    ulElement.innerHTML += `<li>${todo}</li>`;
  });
};
// ---------------------utilities-------------------------------

// 1 create reducer:
const myReducer = (state = [], action) => {
  switch (action.type) {
    case "ADD":
      return [...state, action.todo];
    case "REMOVE":
      const arr = state.filter((todo, index) => {
        return index != action.payload ? todo : false;
      });

      return arr;
    default:
      return state;
  }
};

// 2 create store:
const store = createStore(myReducer);

store.subscribe(() => {
  renderList(store.getState());
});

// ---------------------actions-------------------------------
const formElelment = document.querySelector("#todoForm");
const inputElelment = document.querySelector("#todoText");
const removeFormElement = document.querySelector("#removeForm");
const indexTodoElement = document.querySelector("#indexTodo");

// add:
const onSubmitForm = (e) => {
  e.preventDefault();
  store.dispatch({
    type: "ADD",
    todo: inputElelment.value
  });
  formElelment.reset();
};

// remove:
const liElementOnClick = (e) => {
  e.preventDefault();
  store.dispatch({
    type: "REMOVE",
    payload: indexTodoElement.value
  });
};

formElelment.addEventListener("submit", onSubmitForm);
removeFormElement.addEventListener("submit", liElementOnClick);

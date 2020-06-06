import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

console.log(document.getElementById('range_start'));

const initFlatPicker = () => {
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatPicker }

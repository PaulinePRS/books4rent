import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatPicker = () => {
  flatpickr("#range_start", {
    altInput: true,
    disable: [
        {
            from: "2020-06-17",
            to: "2020-06-24"
        }
    ],
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatPicker }

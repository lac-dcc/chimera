// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`timescale 1ns/1ns;
module TestBench_debouncer
#( parameter DEBOUNCE_TIMER = 3
)
();
reg clk,reset;
reg [3:0] RAW_BTN;

button_debouncer #(.DEBOUNCE_TIMER(DEBOUNCE_TIMER)) DUT (.clk(clk),.reset(reset),.RAW_BTN(RAW_BTN));

always #5 clk=~clk;

initial begin
clk=0;
reset=0;
RAW_BTN=0;
#10;
reset=1;
#10;
reset=0;
#20;
RAW_BTN='b0000;
//#10;
//RAW_BTN='b0000;
//#10;
//RAW_BTN='b0001;
//#10;
//RAW_BTN='b0000;
//#10;
//RAW_BTN='b0001;
//$stop;
end

endmodule
/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/

module fibonacci(input clk, input [1:0] buttons, output [7:0] led);

// The buttons on the mystorm are "active low" (they read as 1 when not pressed, and 0 when pressed)
// Therefore we want to use the inverse of the button, for example
	assign next  = ~buttons[0];

// We then want to keep track of a number and it's previous number before adding these together.

//We also want to make sure that we can reset with the button to clear the previous register and set the current count to 1, else we'll have no sequence at all.

endmodule

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

	reg [3:0] count, count_previous;

	assign led[7:4] = count;


	assign next  = ~buttons[0];
	assign reset = ~buttons[1];

	always @(posedge next or posedge reset) begin
		if (reset) begin
			count <= 1;
			count_previous <= 0;
		end
		else begin
			count <= count + count_previous;
    	count_previous <= count;
		end
  end

endmodule

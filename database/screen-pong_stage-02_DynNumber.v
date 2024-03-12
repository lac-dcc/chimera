//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 18/03/2018 
// Module Name: DynNumber
// Description: Dynamic for a number.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module DynNumber (
        input wire         clk,        // Dynamic clock.
		input wire         reset,      // Back to zero.
		input wire         inc,	       // Increment number.
		input wire         dec,        // Decrement number.
        output wire  [3:0] number,     // Output number.
		output wire        carry_out   // Zero after new increment (carry).
        );

assign number = counter;
assign carry_out = carry;

reg [3:0] counter = 0;
reg stop_inc = 1'b0;
reg stop_dec = 1'b0;
reg carry = 1'b0;

always @(posedge clk)
begin
    if (~inc) stop_inc <= 1'b0;
    if (~dec) stop_dec <= 1'b0;
    if (reset)
        counter <= 0;
    else if (inc && ~stop_inc)
        begin
        stop_inc <= 1'b1;
        if (counter == 9)
			begin
	   		counter <= 0;
			carry <= 1'b1;
			end
        else
            begin
       		counter <= counter+1;
       		carry <= 1'b0;
			end
        end
    else if (dec && ~stop_dec)
        begin
        stop_dec <= 1'b1;
        if (counter == 0)
			begin
	   		counter <= 9;
			carry <= 1'b1;
			end
        else
            begin
       		counter <= counter-1;
       		carry <= 1'b0;
			end
        end
end

endmodule


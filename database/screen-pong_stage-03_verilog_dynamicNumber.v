////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: dynamicNumber.v
//
// Description: Dynamic for a number.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module dynamicNumber (
    input  wire        dyn_clk,    // Dynamic clock.
    input  wire        reset,      // Back to zero.
    input  wire        inc,        // Increment number.
    input  wire        dec,        // Decrement number.
    output wire  [3:0] number,     // Output number.
    output wire        carry       // Zero after new increment (carry).
);

// Registers.
reg [3:0] counter = 0;
reg stop_inc = 1'b0;
reg stop_dec = 1'b0;
reg carry_out = 1'b0;

// Assign outputs.
assign number = counter;
assign carry = carry_out;

always @(posedge dyn_clk)
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
                carry_out <= 1'b1;
            end
        else
            begin
            counter <= counter+1;
            carry_out <= 1'b0;
            end
        end
    else if (dec && ~stop_dec)
        begin
        stop_dec <= 1'b1;
        if (counter == 0)
            begin
            counter <= 9;
            carry_out <= 1'b1;
            end
        else
            begin
            counter <= counter-1;
            carry_out <= 1'b0;
            end
        end
end

endmodule

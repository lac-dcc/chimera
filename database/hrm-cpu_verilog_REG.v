`default_nettype none

module REG (
        input clk,              // clock
        input [7:0] iInbox,
        input [7:0] iAlu,
        input [7:0] iMem,
        input [7:0] iData,
        // control signals
        input wire [1:0] muxR,   // source mux select
        input wR,                // enable signal
        input rst,
        // output: register value
        output reg signed [7:0] R
    );

    initial R = 0;

    always @(posedge clk) begin
        if(rst)
            R <= 8'b0;
        else if(wR)
        begin
            case (muxR)
              2'b00: R <= iInbox;
              2'b01: R <= iMem;
              2'b10: R <= iData;
              2'b11: R <= iAlu;
              default: R <= 8'bx;
            endcase
        end
        else
            R <= R;
    end

`ifndef SYNTHESIS
    always @(R)
       $display("%t DEBUG R=%h", $time, R);
`endif

`ifdef FORMAL

    reg	f_past_valid;
    initial	f_past_valid = 1'b0;
    always @(posedge clk)
        f_past_valid <= 1'b1;

    always @(*) assert( ^R == 1'b0 || ^R == 1'b1 ); // XOR all bits --> no X/Z bits in ^R

`endif

endmodule

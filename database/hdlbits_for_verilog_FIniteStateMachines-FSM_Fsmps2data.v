// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
	output [23:0] out_bytes,
    output done); //

    reg[1:0] state,next_state;
    reg[23:0]inp;
    parameter A=0, B=1, C=2, D=3;
    always @(*) begin
        case(state)
            A:begin
				next_state <= (in[3])?B:A;
			end
            B:begin
				next_state <= C;
			end
            C:begin
				next_state <= D;
			end
            D: next_state <= (in[3])?B:A;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state <=A;
        else
            state<=next_state;
    end
    assign done = (state == D);
    always @(posedge clk) begin
		if(reset)
			inp<=24'd0;
		else begin
			case(next_state)//have to use next_state here due to state changing exactly on clock pulse
				B:begin
					inp[23:16]<=in;
				end
				C:begin
					inp[15:8]<=in;
				end
				D:begin
					inp[7:0]<=in;
				end
			endcase
		end
    end
	assign out_bytes = inp; 
    // State transition logic (combinational)

    // State flip-flops (sequential)
 
    // Output logic

endmodule


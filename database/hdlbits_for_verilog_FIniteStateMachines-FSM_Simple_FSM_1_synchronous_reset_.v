// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=0, B=1; 

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state<=B;
        end else begin
            case (present_state)
                // Fill in state transition logic
                A: next_state = (~in)?B:A;
            	B: next_state = (~in)?A:B;
            endcase

            // State flip-flops
            present_state = next_state;   

            //case (present_state)
                // Fill in output logic
            //endcase
        end
    end
    assign out = present_state;

endmodule

// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A posedge-triggered jk flip-flop with synchronous clear used in my jeff_74x161.

module jk_flip_flop_pos_edge_sync_clear_behavioral (
    input       clk,        // Clock
    input       clrbar,     // Clear
    input       j,          // Inputs
    input       k,          // 
    output reg  q,          // Output
    output      qbar        //
);

    parameter  NOCHANGE   = 2'b0_0,
               RESET      = 2'b0_1,
               SET        = 2'b1_0,
               TOGGLE     = 2'b1_1;

    assign qbar = ~q;

    // JK FLIP-FLOP WITH SYNC CLEAR
    always @ (posedge clk) begin
        if (~clrbar) begin
            q <= 1'b0;
        end else begin
            case({j,k})
                NOCHANGE : q <= q;
                RESET    : q <= 1'b0;
                SET      : q <= 1'b1;
                TOGGLE   : q <= ~q;
            endcase
        end
    end

endmodule

// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A posedge-triggered d flip-flop with synchronous enable used in my jeff_74x377.

module d_flip_flop_pos_edge_sync_en_behavioral (
    input       clk,        // Clock
    input       en,         // Enable
    input       d,          // Data
    output reg  q,          // Output
    output      qbar);      //

    assign qbar = ~q;

    // D FLIP-FLOP WITH SYNC ENABLE
    always @ (posedge clk) begin
        if (en) begin
            q <= d;
        end else begin
            q <= q;
        end
    end

endmodule

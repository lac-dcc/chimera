// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

module reset_gen (
    input   wire    i_clk,
    input   wire    i_res_n,
    output  wire    o_res_n
);

    reg r_ff1;
    reg r_ff2;

    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_ff1 <= 1'b0;
            r_ff2 <= 1'b0;
        end else begin
            r_ff1 <= 1'b1;
            r_ff2 <= r_ff1;
        end
    end
    assign o_res_n = r_ff2;

endmodule
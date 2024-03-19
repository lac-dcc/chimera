`default_nettype none

module therm_out(
    input wire clk,
    input wire rst,
    input wire [31:0] therm_in,
    output wire therm_do,
    output wire therm_fs
);

    reg [5:0] therm_in_buf;

    wire [4:0] therm_z;
    count_lead_zero #(.W_IN(32), .W_OUT(5)) clz (
        .in(therm_in_buf), 
        .out(therm_z)
    );

    reg [4:0] sr;
    reg [3:0] counter;
    always @(posedge clk) begin
        if (counter == 3'd4) begin
            counter <= 0;
            therm_in_buf <= therm_in;
            sr <= therm_z;
        end
        else begin
            counter <= counter + 1;
        end
        if (rst) begin
            counter <= 0;
        end
    end
    wire therm_fs_pre = counter == 0;
    wire therm_do_pre = sr[counter];

    sky130_fd_sc_hd__buf_16 fs_buf(
        .A(therm_fs_pre),
        .X(therm_fs)
    );

    sky130_fd_sc_hd__buf_16 do_buf(
        .A(therm_do_pre),
        .X(therm_do)
    );

endmodule

module count_lead_zero #(
    parameter W_IN = 64, // Must be power of 2, >=2
    parameter W_OUT = 6
) (
    input wire  [W_IN-1:0] in,
    output wire [W_OUT-1:0] out
);

generate
if (W_IN == 2) begin: base
    assign out = !in[1];
end else begin: recurse
    wire [W_OUT-2:0] half_count;
    wire [W_IN / 2-1:0] lhs = in[W_IN / 2 +: W_IN / 2];
    wire [W_IN / 2-1:0] rhs = in[0        +: W_IN / 2];
    wire left_empty = ~|lhs;

    count_lead_zero #(
        .W_IN (W_IN / 2)
    ) inner (
        .in  (left_empty ? rhs : lhs),
        .out (half_count)
    );

    assign out = {left_empty, half_count};
end
endgenerate

endmodule
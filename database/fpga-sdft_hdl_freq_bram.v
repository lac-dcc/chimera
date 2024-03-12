`default_nettype none
module freq_bram
#(
    parameter addr_w    = 7,
    parameter data_w    = 8,
    parameter FILE      = "hdl/freq_bram.list"
)
(
    input wire                  r_clk,
    input wire                  w_clk,
    input wire [addr_w-1:0]     r_addr,
    input wire [addr_w-1:0]     w_addr,
    input wire                  w_en,
    input wire                  r_en,
    input wire [data_w-1:0]     d_in,

    output reg [data_w-1:0]     d_out
);

    reg [data_w-1:0] ram [(1 << addr_w)-1:0];

    initial begin
        if (FILE) $readmemh(FILE, ram);
        d_out <= 0;
    end

    always @(posedge w_clk) begin
        if(w_en)
            ram[w_addr] <= d_in;
    end

    always @(posedge r_clk) begin
        if(r_en)
            d_out <= ram[r_addr];
    end

endmodule


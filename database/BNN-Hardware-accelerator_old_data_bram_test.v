// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

module bram_test (
    // input [11:0]addr_a,
    // input [11:0]addr_b,
    // input ena_a,
    // input ena_b,
    // input we_a,
    // input we_b,
    input clk_a,
    input clk_b,
    input rst_n,
    // input [1279:0]din_a,
    // input [1279:0]din_b,
    output reg [11:0]addr_a_o,
    output reg [11:0]addr_b_o,
    output ena_a_o,
    output ena_b_o,
    output we_a_o,
    output we_b_o,
    output clk_a_o,
    output clk_b_o,
    output [1279:0]din_a_o,
    output [1279:0]din_b_o
);

    reg [1:0] cnt;

    always @(posedge clk_a or negedge rst_n) begin
        if(!rst_n) begin
            cnt<=0;
        end
        else begin
            cnt<=cnt+1;
        end
    end

    assign clk_a_o=clk_a;
    assign clk_b_o=clk_b;
    assign ena_a_o=1;
    assign ena_b_o=1;
    assign we_a_o=0;
    assign we_b_o=0;
    assign din_a_o=0;
    assign din_b_o=0;
    always @(posedge clk_a or negedge rst_n) begin
        if(!rst_n) begin
            addr_a_o<=0;
        end
        else begin
            addr_a_o<=(cnt==3)?addr_a_o+1:addr_a_o;
        end
    end
    always @(posedge clk_a or negedge rst_n) begin
        if(!rst_n) begin
            addr_b_o<=0;
        end
        else begin
            addr_b_o<=(cnt==3)?addr_b_o+1:addr_b_o;
        end
    end


endmodule
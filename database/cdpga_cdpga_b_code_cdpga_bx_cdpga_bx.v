// Author: Duke Fong

module cdpga_bx(
    input       clk_i,
    output      clk_o,

    input       rx,
    output      tx,
    output reg  tx_en
);

assign clk_o = ~clk_i;
wire clk_tmp = clk_o;

wire clk;
wire reset_n;

reg rst_sim = 0;
always @(posedge clk_tmp)
    rst_sim = 1;

cdpga_pll b2v_pll_m(
    .REFERENCECLK(clk_tmp),
    .PLLOUTGLOBAL(clk),
    //.PLLOUTCORE(clk),
    .LOCK(reset_n),
    .RESET(rst_sim));


reg [7:0] counter;

assign tx = ~rx;

always @(posedge clk or negedge reset_n)
    if (!reset_n) begin
        counter <= 0;
        tx_en <= 0;
    end
    else begin
        counter <= counter + 1'b1;
        if (counter >= 10) begin
            counter <= 0;
            tx_en <= !tx_en;
        end
    end

endmodule


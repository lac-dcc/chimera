module top( input         clk,
            inout  [15:0] gpmc_ad,
            input         gpmc_advn,
            input         gpmc_csn1,
            input         gpmc_wein,
            input         gpmc_oen,
            input         gpmc_clk,
            
            input  [1:0]  btn,
            input  [1:0]  sw,
            output [3:0]  led,

            output [7:0]  pmod1,
            output [7:0]  pmod2,
            output [7:0]  pmod3,
            output [7:0]  pmod4,

            output [12:0] sdram_addr,
            inout  [7:0]  sdram_data,
            output [1:0]  sdram_bank,

            output        sdram_clk,
            output        sdram_cke,
            output        sdram_we,
            output        sdram_cs,
            output        sdram_dqm,
            output        sdram_ras,
            output        sdram_cas);

parameter ADDR_WIDTH = 5;
parameter DATA_WIDTH = 16;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH];

reg oe;
reg we;
reg cs;
wire[ADDR_WIDTH-1:0]  addr;
reg [DATA_WIDTH-1:0]  data_out;
wire [DATA_WIDTH-1:0]  data_in;

always @ (posedge clk_200)
begin
    if (!cs && !we && oe) begin
        mem[addr]   <= data_out;
    end
end

always @ (posedge clk_200)
begin
    if (!cs && we && !oe) begin
        mem[0][4]   <= sd_rd_ready;
        mem[0][1]   <= sd_busy;
        mem[4][7:0] <= sd_rd_data;
        data_in <= mem[addr];
    end else begin
        data_in <= 0;
    end
end

/*
icepll -i 100 -o 200

F_PLLIN:   100.000 MHz (given)
F_PLLOUT:  200.000 MHz (requested)
F_PLLOUT:  200.000 MHz (achieved)

FEEDBACK: SIMPLE
F_PFD:  100.000 MHz
F_VCO:  800.000 MHz

DIVR:  0 (4'b0000)
DIVF:  7 (7'b0000111)
DIVQ:  2 (3'b010)

FILTER_RANGE: 5 (3'b101)
*/

wire clk_200;
wire lock;

SB_PLL40_CORE #(
    .FEEDBACK_PATH("SIMPLE"),
    .PLLOUT_SELECT("GENCLK"),
    .DIVR(4'b0000),
    .DIVF(7'b0000111),
    .DIVQ(3'b010),
    .FILTER_RANGE(3'b101)
) uut (
    .LOCK(lock),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .REFERENCECLK(clk),
    .PLLOUTCORE(clk_200)
);

gpmc_sync #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH))
gpmc_controller (
    .clk(clk_200),

    .gpmc_ad(gpmc_ad),
    .gpmc_advn(gpmc_advn),
    .gpmc_csn1(gpmc_csn1),
    .gpmc_wein(gpmc_wein),
    .gpmc_oen(gpmc_oen),
    .gpmc_clk(gpmc_clk),

    .oe(oe),
    .we(we),
    .cs(cs),
    .address(addr),
    .data_out(data_out),
    .data_in(data_in),
);

assign pmod1[0] = sdram_ras;
assign pmod1[1] = sdram_cas;
assign pmod1[2] = sdram_we;
assign pmod1[3] = sdram_clk;
assign pmod1[4] = sdram_dqm;
assign pmod1[7] = sdram_addr[10];

assign led = mem[0][3:0];

assign pmod2 = 8'b00000000;
assign pmod3 = 8'b00000000;
assign pmod4 = 8'b00000000;

assign sdram_clk = clk;

wire [24:0] sd_addr;
wire [7:0]  sd_rd_data;
wire [7:0]  sd_wr_data;
wire        sd_wr_enable;
wire        sd_rd_enable;
wire        sd_busy;
wire        sd_rd_ready; 
wire        sd_rst;

assign sd_addr[15:0]  = mem[1];
assign sd_addr[24:16] = mem[2][8:0];
assign sd_wr_data     = mem[3][7:0];

assign sd_wr_enable = mem[0][3];
assign sd_rd_enable = mem[0][2];
assign sd_rst       = mem[0][0];

sdram_controller sdram_controller_1 (
    .wr_addr(sd_addr),
    .wr_enable(sd_wr_enable),
    .wr_data(sd_wr_data),

    .rd_addr(sd_addr),
    .rd_enable(sd_rd_enable),
    .rd_data(sd_rd_data),
    .rd_ready(sd_rd_ready),
    .busy(sd_busy),
    
    .clk(clk),
    .rst_n(sd_rst),
    
    .addr(sdram_addr),
    .bank_addr(sdram_bank),
    .data(sdram_data),
    .clock_enable(sdram_cke),
    .cs_n(sdram_cs),
    .ras_n(sdram_ras),
    .cas_n(sdram_cas),
    .we_n(sdram_we),
    .data_mask(sdram_dqm)
);

endmodule

module top (input         clk,
            output [3:0]  led,
            inout  [15:0] gpmc_ad,
            input         gpmc_advn,
            input         gpmc_csn1,
            input         gpmc_wein,
            input         gpmc_oen,
            input         gpmc_clk,
            input  [1:0]  btn,

            output        spi_sck,
            output        spi_mosi,
            input         spi_miso,
            output        spi_cs);

parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 16;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

reg oe;
reg we;
reg cs;
wire[ADDR_WIDTH-1:0]  addr;
reg [DATA_WIDTH-1:0]  data_out;
wire [DATA_WIDTH-1:0]  data_in;

always @ (posedge clk)
begin
    if (!cs && !we && oe) begin
        mem[addr] <= data_out;
    end
end

always @ (posedge clk)
begin
    if (!cs && we && !oe) begin
        mem[1][0] <= spi_busy;
        mem[1][1] <= spi_new_data;
        mem[5] <= spi_rx_data[15:0];
        mem[4] <= spi_rx_data[31:16];
        data_in <= mem[addr];
    end else begin
        data_in <= 0;
    end
end

gpmc_sync #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH))
gpmc_controller (
    .clk(clk),

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

wire clk_20m;
wire lock;

SB_PLL40_CORE #(
    .FEEDBACK_PATH("SIMPLE"),
    .PLLOUT_SELECT("GENCLK"),
    .DIVR(4'b0100),
    .DIVF(7'b0011111),
    .DIVQ(3'b101),
    .FILTER_RANGE(3'b010)
) uut (
    .LOCK(lock),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .REFERENCECLK(clk),
    .PLLOUTCORE(clk_20m)
);

localparam MAX_DATA_WIDTH = 32;

initial begin
    mem[0][0] <= 1'b1;
end

wire spi_reset;
wire spi_start;
wire spi_cpol;
wire spi_cpha;
wire [4:0] spi_bits_per_word;
wire [5:0] spi_div;

wire spi_busy;
wire spi_new_data;

wire [MAX_DATA_WIDTH-1:0] spi_tx_data;
reg  [MAX_DATA_WIDTH-1:0] spi_rx_data;

assign spi_tx_data[15:0]  = mem[3];
assign spi_tx_data[31:16] = mem[2];

assign spi_reset         = mem[0][0];
assign spi_start         = mem[0][1];
assign spi_cpol          = mem[0][2];
assign spi_cpha          = mem[0][3];
assign spi_cs            = mem[0][4];
assign spi_bits_per_word = mem[0][9:5];
assign spi_div           = mem[0][15:10];

spi #(
    .MAX_DATA_WIDTH(MAX_DATA_WIDTH))
spi_master (
    .clk(clk_20m),

    .miso(spi_miso),
    .mosi(spi_mosi),
    .sck(spi_sck),

    .start(spi_start),
    .rst(spi_reset),
    .cpol(spi_cpol),
    .cpha(spi_cpha),
    .bits_per_word(spi_bits_per_word),
    .div(spi_div),

    .data_in(spi_tx_data),
    .data_out(spi_rx_data),

    .busy(spi_busy),
    .new_data(spi_new_data)
);

assign led[0] = spi_busy;

endmodule

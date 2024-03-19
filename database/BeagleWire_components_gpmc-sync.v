module gpmc_sync (input                    clk,
                  // GPMC INTERFACE
                  inout  [15:0]            gpmc_ad,
                  input                    gpmc_advn,
                  input                    gpmc_csn1,
                  input                    gpmc_wein,
                  input                    gpmc_oen,
                  input                    gpmc_clk,

                  // HOST INTERFACE
                  output                   oe,
                  output                   we,
                  output                   cs,
                  output [ADDR_WIDTH-1:0]  address,
                  output [DATA_WIDTH-1:0]  data_out,
                  input  [DATA_WIDTH-1:0]  data_in);

parameter ADDR_WIDTH = 16;
parameter DATA_WIDTH = 16;

reg [ADDR_WIDTH-1:0] gpmc_addr;
reg [DATA_WIDTH-1:0] gpmc_data_out;
wire [DATA_WIDTH-1:0] gpmc_data_in;
reg csn_bridge;
reg wen_bridge;
reg oen_bridge;
reg [DATA_WIDTH-1:0] write_bridge;

reg csn_sync;
reg wen_sync;
reg oen_sync;
reg [ADDR_WIDTH-1:0] addr_sync;
reg [DATA_WIDTH-1:0] write_sync;

reg csn;
reg wen;
reg oen;
reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] write;

initial begin
    gpmc_addr <= 5'b00000;
    gpmc_data_out <= 16'b0;
    csn_bridge <= 1'b1;
    wen_bridge <= 1'b1;
    oen_bridge <= 1'b1;
end

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) gpmc_ad_io [15:0] (
    .PACKAGE_PIN(gpmc_ad),
    .OUTPUT_ENABLE(!gpmc_csn1 && gpmc_advn && !gpmc_oen && gpmc_wein),
    .D_OUT_0(gpmc_data_out),
    .D_IN_0(gpmc_data_in)
);

always @ (negedge gpmc_clk)
begin : GPMC_LATCH_ADDRESS   
    if (!gpmc_csn1 && !gpmc_advn && gpmc_wein && gpmc_oen)
        gpmc_addr <= gpmc_data_in;
end

always @ (negedge gpmc_clk)
begin : GEN_RAM_STROBE_SIGNAL
    csn_bridge <= gpmc_csn1;
    wen_bridge <= gpmc_wein;
    oen_bridge <= gpmc_oen;
    write_bridge <= gpmc_data_in;
end

always @ (posedge clk)
begin
// Dual flop synchronizer stage 1
    csn_sync <= csn_bridge;
    wen_sync <= wen_bridge;
    oen_sync <= oen_bridge;
    addr_sync <= gpmc_addr;
    write_sync <= write_bridge;

// Dual flop synchronizer stage 2
    csn <= csn_sync;
    wen <= wen_sync;
    oen <= oen_sync;
    addr <= addr_sync;
    write <= write_sync;

    gpmc_data_out <= data_in;

end

assign cs = csn;
assign we = !(!csn && !wen && oen); // wen
assign oe = !(!csn && wen && !oen); // oen
assign address = addr;
assign data_out = write;

endmodule

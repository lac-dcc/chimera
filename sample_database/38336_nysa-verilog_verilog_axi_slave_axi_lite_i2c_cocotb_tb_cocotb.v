// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ps / 1ps


module tb_cocotb #(
  parameter ADDR_WIDTH          = 32,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8)
)(

input                               clk,
input                               rst,

//Write Address Channel
input                               AXIML_AWVALID,
input       [ADDR_WIDTH - 1: 0]     AXIML_AWADDR,
output                              AXIML_AWREADY,

//Write Data Channel
input                               AXIML_WVALID,
output                              AXIML_WREADY,
input       [STROBE_WIDTH - 1:0]    AXIML_WSTRB,
input       [DATA_WIDTH - 1: 0]     AXIML_WDATA,

//Write Response Channel
output                              AXIML_BVALID,
input                               AXIML_BREADY,
output      [1:0]                   AXIML_BRESP,

//Read Address Channel
input                               AXIML_ARVALID,
output                              AXIML_ARREADY,
input       [ADDR_WIDTH - 1: 0]     AXIML_ARADDR,

//Read Data Channel
output                              AXIML_RVALID,
input                               AXIML_RREADY,
output      [1:0]                   AXIML_RRESP,
output      [DATA_WIDTH - 1: 0]     AXIML_RDATA

);


//Parameters
//Registers

reg               r_rst;
always @ (*)      r_rst           = rst;
reg   [3:0]       test_id         = 0;

reg               prev_clk        = 0;
reg               start           = 0;
reg               prev_dat        = 0;
reg   [7:0]       i2c_clock_count = 0;

/*
reg               sda_tri;

wire              io_scl;
wire              io_sda;

pullup            (io_scl);
pullup            (io_sda);
*/
wire              O_SCL_OUT;
wire              O_SCL_TRI;
wire              I_SCL_IN;
wire              O_SDA_OUT;
wire              O_SDA_TRI;
reg               I_SDA_IN;




assign I_SCL_IN = O_SCL_TRI;
//assign            io_sda = (sda_tri) ? 1'hZ : 1'b0;




//submodules

axi_lite_i2c #(
  .ADDR_WIDTH       (ADDR_WIDTH     ),
  .DATA_WIDTH       (DATA_WIDTH     ),
  .INVERT_AXI_RESET (0              )
) dut (
  .clk              (clk            ),
  .rst              (r_rst          ),


  .i_awvalid        (AXIML_AWVALID  ),
  .i_awaddr         (AXIML_AWADDR   ),
  .o_awready        (AXIML_AWREADY  ),


  .i_wvalid         (AXIML_WVALID   ),
  .o_wready         (AXIML_WREADY   ),
  .i_wdata          (AXIML_WDATA    ),


  .o_bvalid         (AXIML_BVALID   ),
  .i_bready         (AXIML_BREADY   ),
  .o_bresp          (AXIML_BRESP    ),


  .i_arvalid        (AXIML_ARVALID  ),
  .o_arready        (AXIML_ARREADY  ),
  .i_araddr         (AXIML_ARADDR   ),


  .o_rvalid         (AXIML_RVALID   ),
  .i_rready         (AXIML_RREADY   ),
  .o_rresp          (AXIML_RRESP    ),
  .o_rdata          (AXIML_RDATA    ),

  .o_scl_out        (O_SCL_OUT      ),
  .o_scl_tri        (O_SCL_TRI      ),
  .i_scl_in         (I_SCL_IN       ),

  .o_sda_out        (O_SDA_OUT      ),
  .o_sda_tri        (O_SDA_TRI      ),
  .i_sda_in         (I_SDA_IN       )
/*
  io_scl            (io_scl         ),
  io_sda            (io_sda         )
*/

);


//asynchronus logic
//synchronous logic

initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

reg [3:0] count = 0;
always @ (posedge clk) begin
  if (r_rst) begin
    i2c_clock_count <= 0;
    prev_clk <= O_SDA_TRI;
    start    <= 0;
    prev_dat <= 0;
    count = 0;
    I_SDA_IN  <=  1;
  end
  else begin


    if ((prev_dat != O_SDA_TRI) && (O_SCL_TRI))begin
      start   <=  1;
    end

    if (prev_clk & !O_SCL_TRI ) begin
      if (start) begin
        start <= 0;
      end
      else begin

        i2c_clock_count <= i2c_clock_count + 1;
      end
    end


    if (i2c_clock_count == 8) begin
      if (count > 2) begin
        I_SDA_IN  <=  0;
        count <= 0;
      end
      else begin
        count <= count + 1;
      end
    end

    else if (i2c_clock_count > 8) begin
      if (count > 2) begin
        I_SDA_IN  <=  1;
        i2c_clock_count <=  0;
        count <= 0;
      end
      else begin
        count <= count + 1;
      end
    end
    else begin
      I_SDA_IN  <=  O_SDA_TRI;
    end

    prev_clk <= O_SCL_TRI;
    prev_dat <= O_SDA_TRI;
  end
end


endmodule

// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module tb_cocotb #(
  parameter ADDR_WIDTH          = 32,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter AXIS_WIDTH          = 24,
  parameter AXIS_STROBE_WIDTH   = (AXIS_WIDTH / 8),
  parameter BUFFER_SIZE         = 3
)(

input                               clk,
input                               rst,

input                               i_fsync,

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
output      [DATA_WIDTH - 1: 0]     AXIML_RDATA,


input       [AXIS_WIDTH - 1:0]      AXIMS_TDATA,
input                               AXIMS_TREADY,
input                               AXIMS_TVALID,
input                               AXIMS_TLAST,
input       [AXIS_STROBE_WIDTH - 1: 0]   AXIMS_TKEEP,
input       [AXIS_STROBE_WIDTH - 1: 0]   AXIMS_TSTRB,
input       [3:0]                   AXIMS_TID,
input       [31:0]                  AXIMS_TDEST,
input       [3:0]                   AXIMS_TUSER

);


//Local Parameters
//Registers

reg               r_rst;
always @ (*)      r_rst           = rst;
reg   [3:0]       test_id         = 0;

reg   [31:0]      r_tear_count;
reg   [7:0]       r_tear_status;

wire              w_register_data_sel;
reg               r_tearing_effect;
wire              w_write_n;
wire              w_read_n;


wire  [7:0]       w_data;
wire  [7:0]       w_out_data;
wire  [7:0]       w_tri_data;

wire              w_cs_n;
wire              w_reset_n;


reg   [7:0]       r_read_data;

reg   [15:0]      r_write_parameter;
wire  [3:0]       w_axis_user;

assign  w_axis_user = {3'h0, i_fsync};




//submodules

axi_pmod_tft #(
//  .ADDR_WIDTH         (ADDR_WIDTH       ),
  .DATA_WIDTH         (DATA_WIDTH       ),
  .AXIS_WIDTH         (AXIS_WIDTH       ),
  .INVERT_AXI_RESET   (0                ),
  .INVERT_AXIS_RESET  (0                ),
  .BUFFER_SIZE        (BUFFER_SIZE      )
) dut (
  .clk                (clk              ),
  .rst                (r_rst            ),


  //AXI Lite Interface
  .i_awvalid          (AXIML_AWVALID    ),
  .i_awaddr           (AXIML_AWADDR     ),
  .o_awready          (AXIML_AWREADY    ),


  .i_wvalid           (AXIML_WVALID     ),
  .o_wready           (AXIML_WREADY     ),
  .i_wstrb            (AXIML_WSTRB      ),
  .i_wdata            (AXIML_WDATA      ),


  .o_bvalid           (AXIML_BVALID     ),
  .i_bready           (AXIML_BREADY     ),
  .o_bresp            (AXIML_BRESP      ),


  .i_arvalid          (AXIML_ARVALID    ),
  .o_arready          (AXIML_ARREADY    ),
  .i_araddr           (AXIML_ARADDR     ),


  .o_rvalid           (AXIML_RVALID     ),
  .i_rready           (AXIML_RREADY     ),
  .o_rresp            (AXIML_RRESP      ),
  .o_rdata            (AXIML_RDATA      ),

  //AXI Stream
  .i_axis_clk         (clk              ),
  .i_axis_rst         (r_rst            ),
  .o_axis_ready       (AXIMS_TREADY     ),
  .i_axis_data        (AXIMS_TDATA      ),
  .i_axis_last        (AXIMS_TLAST      ),
  .i_axis_valid       (AXIMS_TVALID     ),
  //.i_fsync            (i_fsync          ),
  .i_axis_user        (w_axis_user      ),



  //Physical Signals
  .i_tearing_effect      (r_tearing_effect    ),
  .o_register_data_sel   (w_register_data_sel ),
  .o_write_n             (w_write_n           ),
  .o_read_n              (w_read_n            ),
  .o_cs_n                (w_cs_n              ),
  .o_reset_n             (w_reset_n           ),


  .o_pmod_out_tft_data3  (w_out_data[0]       ),
  .o_pmod_out_tft_data8  (w_out_data[1]       ),
  .o_pmod_out_tft_data2  (w_out_data[2]       ),
  .o_pmod_out_tft_data1  (w_out_data[3]       ),
  .o_pmod_out_tft_data7  (w_out_data[4]       ),
  .o_pmod_out_tft_data9  (w_out_data[5]       ),
  .o_pmod_out_tft_data4  (w_out_data[6]       ),
  .o_pmod_out_tft_data10 (w_out_data[7]       ),

  .o_pmod_tri_tft_data3  (w_tri_data[0]       ),
  .o_pmod_tri_tft_data8  (w_tri_data[1]       ),
  .o_pmod_tri_tft_data2  (w_tri_data[2]       ),
  .o_pmod_tri_tft_data1  (w_tri_data[3]       ),
  .o_pmod_tri_tft_data7  (w_tri_data[4]       ),
  .o_pmod_tri_tft_data9  (w_tri_data[5]       ),
  .o_pmod_tri_tft_data4  (w_tri_data[6]       ),
  .o_pmod_tri_tft_data10 (w_tri_data[7]       ),

  .i_pmod_in_tft_data3   (r_read_data[0]      ),
  .i_pmod_in_tft_data8   (r_read_data[1]      ),
  .i_pmod_in_tft_data2   (r_read_data[2]      ),
  .i_pmod_in_tft_data1   (r_read_data[3]      ),
  .i_pmod_in_tft_data7   (r_read_data[4]      ),
  .i_pmod_in_tft_data9   (r_read_data[5]      ),
  .i_pmod_in_tft_data4   (r_read_data[6]      ),
  .i_pmod_in_tft_data10  (r_read_data[7]      )


);

//asynchronus logic
//synchronous logic

initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

always @ (posedge clk) begin
  if (rst) begin
    r_tear_count            <=  0;
    r_tear_status           <=  8'h00;
    r_tearing_effect        <=  0;
  end
  else begin
    if (r_tear_count < 400) begin
      r_tear_count          <=  r_tear_count + 1;
    end
    else begin
      if (r_tear_status == 8'h00) begin
        r_tear_status       <=  8'h80;
        r_tearing_effect    <=  1;
      end
      else begin
        r_tear_status       <=  8'h00;
        r_tearing_effect    <=  0;
      end
      r_tear_count          <= 0;
    end
  end
end

always @ (posedge clk) begin
  if (rst) begin
    r_read_data             <=  0;
    r_write_parameter       <=  0;
  end
  else begin
    if (!w_write_n && w_register_data_sel) begin
      r_write_parameter     <=  {r_write_parameter[7:0], w_out_data};
    end
    if (!w_register_data_sel & !w_cs_n) begin
      case (w_out_data)
        0: begin
          r_read_data       <=  8'h01;
        end
        14: begin
          r_read_data       <=  r_tear_status;
        end
        44: begin
          r_read_data       <=  8'hFF;
        end
        184: begin
          r_read_data       <=  8'hAA;
        end
      endcase
    end
  end
end


endmodule

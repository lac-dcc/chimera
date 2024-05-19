// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

`define CLOG2(x) \
   (x <= 2)     ? 1 :  \
   (x <= 4)     ? 2 :  \
   (x <= 8)     ? 3 :  \
   (x <= 16)    ? 4 :  \
   (x <= 32)    ? 5 :  \
   (x <= 64)    ? 6 :  \
   (x <= 128)   ? 7 :  \
   (x <= 256)   ? 8 :  \
   (x <= 512)   ? 9 :  \
   (x <= 1024)  ? 10 : \
   (x <= 2048)  ? 11 : \
   (x <= 4096)  ? 12 : \
   -1

module tb_cocotb #(
  parameter DATA_WIDTH          = 32, //This is the output bus
  parameter ADDR_WIDTH          = 32,
  parameter MAX_PACKET_SIZE     = 4096,
  parameter MAX_PACKET_WIDTH    = `CLOG2(MAX_PACKET_SIZE),
  parameter INTERRUPT_WIDTH     = 32
)(

//Virtual Host Interface Signals
input                               clk,
input                               rst,


input       [31:0]                  test_id,

input                               CMD_EN,
output                              CMD_ERROR,
output                              CMD_ACK,

input       [ADDR_WIDTH - 1:0]      CMD_ADR,
input                               CMD_ADR_FIXED,
input                               CMD_ADR_WRAP,

input                               CMD_WR_RD,        //1 = wRITE, 0 = rEAD
input       [MAX_PACKET_WIDTH - 1: 0]CMD_COUNT,

output      [31:0]                  CMD_STATUS,
output                              CMD_INTERRUPT,

//Data FIFOs
//write side
input                               WR_CLK,
output      [1:0]                   WR_RDY,
input       [1:0]                   WR_ACT,
output      [23:0]                  WR_SIZE,
input                               WR_STB,
input       [DATA_WIDTH - 1: 0]     WR_DATA,
output                              WR_STARVED,

//read side
input                               RD_CLK,
input                               RD_STB,
output                              RD_RDY,
input                               RD_ACT,
output      [23:0]                  RD_SIZE,
output      [DATA_WIDTH - 1: 0]     RD_DATA,

  //NOT IMPLEMENTED YET
/*
  input       [2:0]                   i_cmd_txrx_width, //0 = 8-bit, 1 = 16-bit, 16-bit, 2 = 32-bit...
  input       [3:0]                   i_cmd_aw_id,  //Add an ide to the write/command paths
  input       [3:0]                   i_cmd_w_id,
  input       [3:0]                   i_cmd_ar_id,
  output      [3:0]                   o_cmd_r_id,
  output      [3:0]                   o_cmd_b_id,
*/


//***************** AXI Bus ************************************************

//bus write addr path
output      [3:0]                     AXIS_AWID,         //Write ID
output      [ADDR_WIDTH - 1:0]        AXIS_AWADDR,       //Write Addr Path Address
output      [7:0]                     AXIS_AWLEN,        //Write Addr Path Burst Length
output      [2:0]                     AXIS_AWSIZE,       //Write Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)
output      [1:0]                     AXIS_AWBURST,      //Write Addr Path Burst Type
                                                          //  0 = Fixed
                                                          //  1 = Incrementing
                                                          //  2 = wrap
output      [1:0]                     AXIS_AWLOCK,       //Write Addr Path Lock (atomic) information
                                                          //  0 = Normal
                                                          //  1 = Exclusive
                                                          //  2 = Locked
output      [3:0]                     AXIS_AWCACHE,      //Write Addr Path Cache Type
output      [2:0]                     AXIS_AWPROT,       //Write Addr Path Protection Type
output                                AXIS_AWVALID,      //Write Addr Path Address Valid
input                                 AXIS_AWREADY,      //Write Addr Path Slave Ready
                                                          //  1 = Slave Ready
                                                          //  0 = Slave Not Ready

//bus write data
output      [3:0]                     AXIS_WID,          //Write ID
output      [DATA_WIDTH - 1: 0]       AXIS_WDATA,        //Write Data (this size is set with the DATA_WIDTH Parameter
                                                      //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
output      [(DATA_WIDTH >> 3) - 1:0] AXIS_WSTRB,      //Write Strobe (a 1 in the write is associated with the byte to write)
output                                AXIS_WLAST,        //Write Last transfer in a write burst
output                                AXIS_WVALID,       //Data through this bus is valid
input                                 AXIS_WREADY,       //Slave is ready for data

//Write Response Channel
input       [3:0]                     AXIS_BID,          //Response ID (this must match awid)
input       [1:0]                     AXIS_BRESP,        //Write Response
                                                          //  0 = OKAY
                                                          //  1 = EXOKAY
                                                          //  2 = SLVERR
                                                          //  3 = DECERR
input                                 AXIS_BVALID,       //Write Response is:
                                                          //  1 = Available
                                                          //  0 = Not Available
output                                AXIS_BREADY,       //WBM Ready

//bus read addr path
output       [3:0]                    AXIS_ARID,         //Read ID
output       [ADDR_WIDTH - 1:0]       AXIS_ARADDR,       //Read Addr Path Address
output       [7:0]                    AXIS_ARLEN,        //Read Addr Path Burst Length
output       [2:0]                    AXIS_ARSIZE,       //Read Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)
output       [1:0]                    AXIS_ARBURST,      //Read Addr Path Burst Type
output       [1:0]                    AXIS_ARLOCK,       //Read Addr Path Lock (atomic) information
output       [3:0]                    AXIS_ARCACHE,      //Read Addr Path Cache Type
output       [2:0]                    AXIS_ARPROT,       //Read Addr Path Protection Type
output                                AXIS_ARVALID,      //Read Addr Path Address Valid
input                                 AXIS_ARREADY,      //Read Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready
//bus read data
input       [3:0]                     AXIS_RID,          //Write ID
input       [DATA_WIDTH - 1: 0]       AXIS_RDATA,        //Write Data (this size is set with the DATA_WIDTH Parameter
                                                          //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
input       [1:0]                     AXIS_RRESP,
input       [(DATA_WIDTH >> 3) - 1:0] AXIS_RSTRB,      //Write Strobe (a 1 in the write is associated with the byte to write)
input                                 AXIS_RLAST,        //Write Last transfer in a write burst
input                                 AXIS_RVALID,       //Data through this bus is valid
output                                AXIS_RREADY,       //WBM is ready for data
                                                        //  1 = WBM Ready
                                                        //  0 = Slave Ready

input     [INTERRUPT_WIDTH - 1:0]   i_interrupts


);

//Local Parameters
localparam        INVERT_AXI_RESET      = 0;
localparam        FIFO_DEPTH            = 8; //256
localparam        ENABLE_NACK           = 0; //Enable timeout
localparam        DEFAULT_TIMEOUT       = 32'd100000000;  //1 Second at 100MHz


//Registers/Wires
reg                               r_rst;

wire      [INTERRUPT_WIDTH - 1:0] w_interrupts;

//Submodules
axi_master #(
  .INVERT_AXI_RESET     (INVERT_AXI_RESET        ),
  .MAX_PACKET_SIZE      (MAX_PACKET_SIZE         ),
  .ADDR_WIDTH           (ADDR_WIDTH              ),
  .DATA_WIDTH           (DATA_WIDTH              ),
  .INTERRUPT_WIDTH      (INTERRUPT_WIDTH         ),
  .ENABLE_NACK          (ENABLE_NACK             ),
  .DEFAULT_TIMEOUT      (DEFAULT_TIMEOUT         )
) am (

  .clk                   (clk                    ),
  .rst                   (r_rst                  ),
  //************* User Facing Side *******************************************
  .i_cmd_en              (CMD_EN                 ),
  .o_cmd_error           (CMD_ERROR              ),
  .o_cmd_ack             (CMD_ACK                ),

  .o_cmd_status          (CMD_STATUS             ),
  .o_cmd_interrupt       (CMD_INTERRUPT          ),

  .i_cmd_addr            (CMD_ADR                ),
  .i_cmd_adr_fixed_en    (CMD_ADR_FIXED          ),
  .i_cmd_adr_wrap_en     (CMD_ADR_WRAP           ),

  .i_cmd_wr_rd           (CMD_WR_RD              ),
  .i_cmd_data_count      (CMD_COUNT              ),

  //Data FIFOs
  .i_ingress_clk         (WR_CLK                 ),
  .o_ingress_rdy         (WR_RDY                 ),
  .i_ingress_act         (WR_ACT                 ),
  .i_ingress_stb         (WR_STB                 ),
  .i_ingress_data        (WR_DATA                ),
  .o_ingress_size        (WR_SIZE                ),

  .i_egress_clk          (RD_CLK                 ),
  .o_egress_rdy          (RD_RDY                 ),
  .i_egress_act          (RD_ACT                 ),
  .i_egress_stb          (RD_STB                 ),
  .o_egress_data         (RD_DATA                ),
  .o_egress_size         (RD_SIZE                ),




  //***************** AXI Bus ************************************************
  //bus write addr path
  .o_awid                (AXIS_AWID              ),
  .o_awaddr              (AXIS_AWADDR            ),
  .o_awlen               (AXIS_AWLEN             ),
  .o_awsize              (AXIS_AWSIZE            ),
  .o_awburst             (AXIS_AWBURST           ),
  .o_awlock              (AXIS_AWLOCK            ),
  .o_awcache             (AXIS_AWCACHE           ),
  .o_awprot              (AXIS_AWPROT            ),
  .o_awvalid             (AXIS_AWVALID           ),
  .i_awready             (AXIS_AWREADY           ),

  //bus write data
  .o_wid                 (AXIS_WID               ),
  .o_wdata               (AXIS_WDATA             ),
  .o_wstrobe             (AXIS_WSTRB             ),
  .o_wlast               (AXIS_WLAST             ),
  .o_wvalid              (AXIS_WVALID            ),
  .i_wready              (AXIS_WREADY            ),

  //Write Response Channel
  .i_bid                 (AXIS_BID               ),
  .i_bresp               (AXIS_BRESP             ),
  .i_bvalid              (AXIS_BVALID            ),
  .o_bready              (AXIS_BREADY            ),

  //bus read addr path
  .o_arid                (AXIS_ARID              ),
  .o_araddr              (AXIS_ARADDR            ),
  .o_arlen               (AXIS_ARLEN             ),
  .o_arsize              (AXIS_ARSIZE            ),
  .o_arburst             (AXIS_ARBURST           ),
  .o_arlock              (AXIS_ARLOCK            ),
  .o_arcache             (AXIS_ARCACHE           ),
  .o_arprot              (AXIS_ARPROT            ),
  .o_arvalid             (AXIS_ARVALID           ),
  .i_arready             (AXIS_ARREADY           ),

  //bus read data
  .i_rid                 (AXIS_RID               ),
  .i_rdata               (AXIS_RDATA             ),
  .i_rresp               (AXIS_RRESP             ),
  .i_rstrobe             (AXIS_RSTRB             ),
  .i_rlast               (AXIS_RLAST             ),
  .i_rvalid              (AXIS_RVALID            ),
  .o_rready              (AXIS_RREADY            ),


  //nterrupts
  .i_interrupts          (i_interrupts           )
);

//There is a timing thing in COCOTB when stiumlating a signal, sometimes it can be corrupted if not registered
always @ (*) r_rst          = rst;



//Submodules
//Asynchronous Logic
//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule

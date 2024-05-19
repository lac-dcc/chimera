// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module tb_cocotb #(
  parameter DATA_WIDTH          = 32, //This is the output bus
  parameter ADDR_WIDTH          = 32,
  parameter INTERRUPT_WIDTH     = 32
)(

//Virtual Host Interface Signals
input                                 clk,
input                                 rst,

input       [31:0]                    test_id,

input                                 CMD_EN,
output                                CMD_ERROR,
output                                CMD_ACK,
output      [31:0]                    CMD_STATUS,
output                                CMD_INTERRUPT,

input       [ADDR_WIDTH - 1:0]        CMD_ADR,
input                                 CMD_WR_RD,        //1 = WRITE, 0 = READ
input       [3:0]                     CMD_BYTE_EN,
input       [31:0]                    CMD_WR_DATA,
output      [31:0]                    CMD_RD_DATA,


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
output      [3:0]                     AXIS_WID,           //Write ID
output      [DATA_WIDTH - 1: 0]       AXIS_WDATA,         //Write Data (this size is set with the DATA_WIDTH Parameter
                                                         //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
output      [(DATA_WIDTH >> 3) - 1:0] AXIS_WSTRB,        //Write Strobe (a 1 in the write is associated with the byte to write)
output                                AXIS_WLAST,         //Write Last transfer in a write burst
output                                AXIS_WVALID,        //Data through this bus is valid
input                                 AXIS_WREADY,        //Slave is ready for data

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
input       [3:0]                     AXIS_RID,        //Write ID
input       [DATA_WIDTH - 1: 0]       AXIS_RDATA,      //Write Data (this size is set with the DATA_WIDTH Parameter
                                                        //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
input       [1:0]                     AXIS_RRESP,
input       [(DATA_WIDTH >> 3) - 1:0] AXIS_RSTRB,      //Write Strobe (a 1 in the write is associated with the byte to write)
input                                 AXIS_RLAST,      //Write Last transfer in a write burst
input                                 AXIS_RVALID,     //Data through this bus is valid
output                                AXIS_RREADY,     //WBM is ready for data
                                                          //  1 = WBM Ready
                                                          //  0 = Slave Ready
input       [INTERRUPT_WIDTH - 1:0]   i_interrupts
);

//Local Parameters
localparam INVERT_AXI_RESET       = 0;
localparam DEFAULT_TIMEOUT        = 32'd100000000;  //1 Second at 100MHz

//Registers/Wires
reg                                 r_rst;
wire      [INTERRUPT_WIDTH - 1:0]   w_interrupts;
assign    AXIS_AWLEN              = 0;
assign    AXIS_AWBURST            = 1;
assign    AXIS_AWPROT             = 0;
assign    AXIS_ARBURST            = 1;
assign    AXIS_ARPROT             = 0;

//Submodules
axi_lite_master #(
  .INVERT_AXI_RESET       (INVERT_AXI_RESET       ),
  .ADDR_WIDTH             (ADDR_WIDTH             ),
  .INTERRUPT_WIDTH        (INTERRUPT_WIDTH        ),
  .DEFAULT_TIMEOUT        (DEFAULT_TIMEOUT        )
) am (

  .clk                    (clk                    ),
  .rst                    (r_rst                  ),
  //************* User Facing Side *******************************************
  .i_cmd_en               (CMD_EN                 ),
  .o_cmd_error            (CMD_ERROR              ),
  .o_cmd_ack              (CMD_ACK                ),

  .o_cmd_status           (CMD_STATUS             ),
  .i_cmd_addr             (CMD_ADR                ),
  .i_cmd_wr_rd            (CMD_WR_RD              ),

  .i_cmd_byte_en          (CMD_BYTE_EN            ),
  .i_cmd_data             (CMD_WR_DATA            ),
  .o_cmd_data             (CMD_RD_DATA            ),
  .o_cmd_interrupt        (CMD_INTERRUPT          ),

  //***************** AXI Bus ************************************************
  //bus write addr path
  .o_awid                 (AXIS_AWID              ),
  .o_awaddr               (AXIS_AWADDR            ),
  .o_awsize               (AXIS_AWSIZE            ),
  .o_awvalid              (AXIS_AWVALID           ),
  .i_awready              (AXIS_AWREADY           ),

  //bus write data
  .o_wid                  (AXIS_WID               ),
  .o_wdata                (AXIS_WDATA             ),
  .o_wstrobe              (AXIS_WSTRB             ),
  .o_wlast                (AXIS_WLAST             ),
  .o_wvalid               (AXIS_WVALID            ),
  .i_wready               (AXIS_WREADY            ),

  //Write Response Channel
  .i_bid                  (AXIS_BID               ),
  .i_bresp                (AXIS_BRESP             ),
  .i_bvalid               (AXIS_BVALID            ),
  .o_bready               (AXIS_BREADY            ),

  //bus read addr path
  .o_arid                 (AXIS_ARID              ),
  .o_araddr               (AXIS_ARADDR            ),
  .o_arlen                (AXIS_ARLEN             ),
  .o_arsize               (AXIS_ARSIZE            ),
  .o_arvalid              (AXIS_ARVALID           ),
  .i_arready              (AXIS_ARREADY           ),

  //bus read data
  .i_rid                  (AXIS_RID               ),
  .i_rdata                (AXIS_RDATA             ),
  .i_rresp                (AXIS_RRESP             ),
  .i_rstrobe              (AXIS_RSTRB             ),
  .i_rlast                (AXIS_RLAST             ),
  .i_rvalid               (AXIS_RVALID            ),
  .o_rready               (AXIS_RREADY            ),

  //nterrupts
  .i_interrupts           (i_interrupts           )
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

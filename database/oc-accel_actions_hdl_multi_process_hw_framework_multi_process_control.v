`timescale 1ns/1ps

module mp_control #(
    parameter KERNEL_NUM = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
                      input             clk                   ,
                      input             rst_n                 ,

                      //---- AXI Lite bus----
                        // AXI write address channel
                      output    reg                     s_axi_awready   ,
                      input         [ADDR_WIDTH - 1:0]  s_axi_awaddr    ,
                      input         [02:0]              s_axi_awprot    ,
                      input                             s_axi_awvalid   ,
                        // axi write data channel
                      output    reg                     s_axi_wready    ,
                      input         [DATA_WIDTH - 1:0]  s_axi_wdata     ,
                      input      [(DATA_WIDTH/8) - 1:0] s_axi_wstrb     ,
                      input                             s_axi_wvalid    ,
                        // AXI response channel
                      output        [01:0]              s_axi_bresp     ,
                      output    reg                     s_axi_bvalid    ,
                      input                             s_axi_bready    ,
                        // AXI read address channel
                      output    reg                     s_axi_arready   ,
                      input                             s_axi_arvalid   ,
                      input         [ADDR_WIDTH - 1:0]  s_axi_araddr    ,
                      input         [02:0]              s_axi_arprot    ,
                        // AXI read data channel
                      output    reg [DATA_WIDTH - 1:0]  s_axi_rdata     ,
                      output        [01:0]              s_axi_rresp     ,
                      input                             s_axi_rready    ,
                      output    reg                     s_axi_rvalid    ,
                      //---- local control ----
                      output        [8:0]               cmpl_ram_addr_o ,
                      output                            cmpl_ram_hi_o   ,
                      output                            cmpl_ram_lo_o   ,
                      output        [31:0]              cmpl_ram_data_o ,
                      output        [87:0]              process_info_o  ,
                      output    reg                     process_start_o ,
                      input                             process_ready_i ,
                      input         [31:0]              i_action_type   ,
                      input         [31:0]              i_action_version
                      );


//---- declarations ----
// For 32bit write data.
 reg    [31:0]              write_address;
 wire   [31:0]              wr_mask;
 reg    [31:0]              REG_global_control;
 reg    [8:0]               process_id;
 wire                       ram_read;
 wire                       ram_write0;
 wire                       ram_write1;
 wire   [8:0]               ram_read_addr;
 wire   [8:0]               ram_write_addr;
 wire   [63:0]              ram_read_data;
 wire   [31:0]              ram_write_data;

//---- parameters ----
 // Register addresses arrangement
 parameter ADDR_GLOBAL_CONTROL               = 'h24,
           ADDR_INIT_ADDR_LO                 = 'h28,
           ADDR_INIT_ADDR_HI                 = 'h2C,
           ADDR_CMPL_ADDR_LO                 = 'h30,
           ADDR_CMPL_ADDR_HI                 = 'h34;

assign cmpl_ram_hi_o = s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_CMPL_ADDR_HI);
assign cmpl_ram_lo_o = s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_CMPL_ADDR_LO);
assign cmpl_ram_addr_o = write_address[30:22];
assign cmpl_ram_data_o = s_axi_wdata;

/***********************************************************************
*                          writing registers                           *
***********************************************************************/

//---- write address capture ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     write_address <= 32'd0;
   else if(s_axi_awvalid & s_axi_awready)
     write_address <= s_axi_awaddr;

//---- write address ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_awready <= 1'b0;
   else if(s_axi_awvalid)
     s_axi_awready <= 1'b1;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_awready <= 1'b0;

//---- write data ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_wready <= 1'b0;
   else if(process_start_o & !process_ready_i)
     s_axi_wready <= 1'b0;
   else if(s_axi_awvalid & s_axi_awready)
     s_axi_wready <= 1'b1;
   else if(s_axi_wvalid)
     s_axi_wready <= 1'b0;

//---- handle write data strobe ----
 assign wr_mask = {{8{s_axi_wstrb[3]}},{8{s_axi_wstrb[2]}},{8{s_axi_wstrb[1]}},{8{s_axi_wstrb[0]}}};

/***********************************************************************
*                       reading registers                              *
***********************************************************************/

//---- read registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rdata <= 32'd0;
   else if(s_axi_arvalid & s_axi_arready)
     case(s_axi_araddr)
//       ADDR_SNAP_ACTION_TYPE     : s_axi_rdata <= i_action_type;
       ADDR_GLOBAL_CONTROL       : s_axi_rdata <= REG_global_control;
//       ADDR_INIT_ADDR_HI         : s_axi_rdata <= REG_init_addr_hi;
//       ADDR_INIT_ADDR_LO         : s_axi_rdata <= REG_init_addr_lo;
       default                   : s_axi_rdata <= 32'h5a5aa5a5;
     endcase

//---- address ready: deasserts once arvalid is seen; reasserts when current read is done ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_arready <= 1'b1;
   else if(s_axi_arvalid)
     s_axi_arready <= 1'b0;
   else if(s_axi_rvalid & s_axi_rready)
     s_axi_arready <= 1'b1;

//---- data ready: deasserts once rvalid is seen; reasserts when new address has come ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rvalid <= 1'b0;
   else if (s_axi_arvalid & s_axi_arready)
     s_axi_rvalid <= 1'b1;
   else if (s_axi_rready)
     s_axi_rvalid <= 1'b0;

/***********************************************************************
*                        status reporting                              *
***********************************************************************/

//---- axi write response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_bvalid <= 1'b0;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_bvalid <= 1'b1;
   else if(s_axi_bready)
     s_axi_bvalid <= 1'b0;

 assign s_axi_bresp = 2'd0;
 assign s_axi_rresp = 2'd0;

/***********************************************************************
*                        control                                       *
***********************************************************************/

addr_ram addr_ram_low(
    .clk    (clk            ),
    .d      (ram_write_data ),
    .dpra   (ram_read_addr  ),
    .a      (ram_write_addr ),
    .we     (ram_write1     ),
    .dpo    (ram_read_data[31:0]  )
);

addr_ram addr_ram_high(
    .clk    (clk            ),
    .d      (ram_write_data ),
    .dpra   (ram_read_addr  ),
    .a      (ram_write_addr ),
    .we     (ram_write0     ),
    .dpo    (ram_read_data[63:32]  )
);

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        REG_global_control <= 32'b0;
    else if(s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_GLOBAL_CONTROL))
        REG_global_control <= s_axi_wdata;

assign ram_read = s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_GLOBAL_CONTROL);
assign ram_read_addr = write_address[30:22];
assign ram_write0 = s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_INIT_ADDR_HI);
assign ram_write1 = s_axi_wvalid & s_axi_wready & (write_address[20:0] == ADDR_INIT_ADDR_LO);
assign ram_write_addr = write_address[30:22];
assign ram_write_data = s_axi_wdata;
assign process_info_o = {7'b0,REG_global_control[15:8],process_id,ram_read_data};

always@(posedge clk) process_id <= write_address[30:22];

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        process_start_o <= 1'b0;
    else if(ram_read)
        process_start_o <= 1'b1;
    else if(process_ready_i)
        process_start_o <= 1'b0;

endmodule

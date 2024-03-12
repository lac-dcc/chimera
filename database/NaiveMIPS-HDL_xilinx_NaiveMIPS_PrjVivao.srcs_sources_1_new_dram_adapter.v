`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/17 09:36:34
// Design Name: 
// Module Name: dram_adapter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dram_adapter(
/*autoport*/
//inout
            ddr3_dq,
            ddr3_dqs_p,
            ddr3_dqs_n,
//output
            rddata1,
            stall1,
            rddata2,
            stall2,
            ddr3_addr,
            ddr3_ba,
            ddr3_ras_n,
            ddr3_cas_n,
            ddr3_we_n,
            ddr3_odt,
            ddr3_reset_n,
            ddr3_cke,
            ddr3_dm,
            ddr3_ck_p,
            ddr3_ck_n,
//input
            rst_n,
            clk,
            sysclk100M,
            refclk200M,
            address1,
            wrdata1,
            dataenable1,
            rd1,
            wr1,
            address2,
            wrdata2,
            dataenable2,
            rd2,
            wr2);
 
input wire rst_n;
input wire clk;

input wire sysclk100M;
input wire refclk200M;

input wire[31:0] address1;
input wire[31:0] wrdata1;
output wire[31:0] rddata1;
input wire[3:0] dataenable1;
input wire rd1;
input wire wr1;
output wire stall1;

input wire[31:0] address2;
input wire[31:0] wrdata2;
output wire[31:0] rddata2;
input wire[3:0] dataenable2;
input wire rd2;
input wire wr2;
output wire stall2;


//------DDR3 interface------
inout  wire[15:0] ddr3_dq;
output wire[12:0] ddr3_addr;
output wire[2 :0] ddr3_ba;
output wire       ddr3_ras_n;
output wire       ddr3_cas_n;
output wire       ddr3_we_n;
output wire       ddr3_odt;
output wire       ddr3_reset_n;
output wire       ddr3_cke;
output wire[1:0]  ddr3_dm;
inout  wire[1:0]  ddr3_dqs_p;
inout  wire[1:0]  ddr3_dqs_n;
output wire       ddr3_ck_p;
output wire       ddr3_ck_n;


wire [31:0]AHB1_haddr;
wire [2:0]AHB1_hburst;
wire [3:0]AHB1_hprot;
wire [31:0]AHB1_hrdata;
wire AHB1_hready_in;
wire AHB1_hready_out;
wire AHB1_hresp;
wire [2:0]AHB1_hsize;
wire [1:0]AHB1_htrans;
wire [31:0]AHB1_hwdata;
wire AHB1_hwrite;
wire AHB1_sel;
wire [31:0]AHB2_haddr;
wire [2:0]AHB2_hburst;
wire [3:0]AHB2_hprot;
wire [31:0]AHB2_hrdata;
wire AHB2_hready_in;
wire AHB2_hready_out;
wire AHB2_hresp;
wire [2:0]AHB2_hsize;
wire [1:0]AHB2_htrans;
wire [31:0]AHB2_hwdata;
wire AHB2_hwrite;
wire AHB2_sel;

ahb_adapter bridge1(
    .clk           (clk),
    .rst_n         (rst_n),
    .AHB_haddr     (AHB1_haddr),
    .AHB_hburst    (AHB1_hburst),
    .AHB_hprot     (AHB1_hprot),
    .AHB_hrdata    (AHB1_hrdata),
    .AHB_hready_in (AHB1_hready_in),
    .AHB_hready_out(AHB1_hready_out),
    .AHB_hresp     (AHB1_hresp),
    .AHB_hsize     (AHB1_hsize),
    .AHB_htrans    (AHB1_htrans),
    .AHB_hwdata    (AHB1_hwdata),
    .AHB_hwrite    (AHB1_hwrite),
    .AHB_sel       (AHB1_sel),
    .address       (address1),
    .wrdata        (wrdata1),
    .rddata        (rddata1),
    .dataenable    (dataenable1),
    .rd            (rd1),
    .wr            (wr1),
    .stall         (stall1)
);

ahb_adapter bridge2(
    .clk           (clk),
    .rst_n         (rst_n),
    .AHB_haddr     (AHB2_haddr),
    .AHB_hburst    (AHB2_hburst),
    .AHB_hprot     (AHB2_hprot),
    .AHB_hrdata    (AHB2_hrdata),
    .AHB_hready_in (AHB2_hready_in),
    .AHB_hready_out(AHB2_hready_out),
    .AHB_hresp     (AHB2_hresp),
    .AHB_hsize     (AHB2_hsize),
    .AHB_htrans    (AHB2_htrans),
    .AHB_hwdata    (AHB2_hwdata),
    .AHB_hwrite    (AHB2_hwrite),
    .AHB_sel       (AHB2_sel),
    .address       (address2),
    .wrdata        (wrdata2),
    .rddata        (rddata2),
    .dataenable    (dataenable2),
    .rd            (rd2),
    .wr            (wr2),
    .stall         (stall2)
);

//ddr3 controller
bd_mem_wrapper bd_memory (
    // Inouts
    .ddr3_dq             (ddr3_dq         ),  
    .ddr3_dqs_p          (ddr3_dqs_p      ),    // for X16 parts 
    .ddr3_dqs_n          (ddr3_dqs_n      ),  // for X16 parts
    // Outputs
    .ddr3_addr           (ddr3_addr       ),  
    .ddr3_ba             (ddr3_ba         ),
    .ddr3_ras_n          (ddr3_ras_n      ),                        
    .ddr3_cas_n          (ddr3_cas_n      ),                        
    .ddr3_we_n           (ddr3_we_n       ),                          
    .ddr3_reset_n        (ddr3_reset_n    ),
    .ddr3_ck_p           (ddr3_ck_p       ),                          
    .ddr3_ck_n           (ddr3_ck_n       ),       
    .ddr3_cke            (ddr3_cke        ),                          
    .ddr3_dm             (ddr3_dm         ),
    .ddr3_odt            (ddr3_odt        ),
    
    .AHB1_haddr(AHB1_haddr),
    .AHB1_hburst(AHB1_hburst),
    .AHB1_hprot(AHB1_hprot),
    .AHB1_hrdata(AHB1_hrdata),
    .AHB1_hready_in(AHB1_hready_in),
    .AHB1_hready_out(AHB1_hready_out),
    .AHB1_hresp(AHB1_hresp),
    .AHB1_hsize(AHB1_hsize),
    .AHB1_htrans(AHB1_htrans),
    .AHB1_hwdata(AHB1_hwdata),
    .AHB1_hwrite(AHB1_hwrite),
    .AHB1_sel(AHB1_sel),
    .AHB2_haddr(AHB2_haddr),
    .AHB2_hburst(AHB2_hburst),
    .AHB2_hprot(AHB2_hprot),
    .AHB2_hrdata(AHB2_hrdata),
    .AHB2_hready_in(AHB2_hready_in),
    .AHB2_hready_out(AHB2_hready_out),
    .AHB2_hresp(AHB2_hresp),
    .AHB2_hsize(AHB2_hsize),
    .AHB2_htrans(AHB2_htrans),
    .AHB2_hwdata(AHB2_hwdata),
    .AHB2_hwrite(AHB2_hwrite),
    .AHB2_sel(AHB2_sel),

    .clk_ref_i      (refclk200M),
    .cpu_clk        (clk),
    .cpu_rstn       (rst_n),

    .sys_clk_i      (sysclk100M),
    .sys_rst        (~rst_n)
);
endmodule

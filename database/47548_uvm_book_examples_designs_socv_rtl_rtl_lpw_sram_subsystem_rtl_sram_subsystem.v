// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : sram_subsystem.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

module sram_subsystem(

              //inputs
    		hclk,          // AHB Clock
    		n_hreset,       // AHB reset - Active low
    // AHB interface
    		hsel,          // AHB2APB select
    		haddr,         // Address bus
    		htrans,        // Transfer type
    		hsize,         // AHB Access type - byte, half-word, word
    		hwrite,        // Write signal
    		hwdata,        // Write data
         hready_in,     // Combined hready across all slaves
         hburst,        // hburst signal
         hprot,         // hprot signal
         hmaster,       // hmaster signal
         hmastlock,     // master lock signal
   		scan_mode,    // Scan mode for controlling test muxing
         // gate indications
         clk_SRPG_macb0_en,
         clk_SRPG_macb1_en,
         clk_SRPG_macb2_en,
         clk_SRPG_macb3_en,
    // Outputs
    // AHB interface
    		hrdata,       // Read data provided from target slave
    		hready,       // Ready for new bus cycle from target slave
    		hresp        // Response from the bridge

);
//------------------------------------------------------------------------------

 // Inputs     
    // system signals
    input        hclk;     // AHB Clock
    input        n_hreset;  // AHB reset - Active low
    // AHB interface 
    input        hsel;     // AHB2APB select
    input [31:0] haddr;    // Address bus
    input [1:0]  htrans;   // Transfer type
    input [2:0]  hsize;    // AHB Access type - byte, half-word, word
    input [31:0] hwdata;   // Write data
    input        hwrite;   // Write signal
    input        hready_in;// Indicates that last master has finished bus access
    input [2:0]  hburst;
    input [3:0]  hprot;
    input [3:0]  hmaster;
    input        hmastlock;
    
    // Scan inputs
    input        scan_mode; // Scan mode for controlling test muxing

    // gate indications
    input clk_SRPG_macb0_en;
    input clk_SRPG_macb1_en;
    input clk_SRPG_macb2_en;
    input clk_SRPG_macb3_en;

    // Outputs
    // AHB interface
    output [31:0] hrdata;       // Read data provided from target slave
    output        hready;       // Ready for new bus cycle from target slave
    output [1:0]  hresp;        // Response from the bridge


//------------------------------------------------------------------------------
// if the SRAM subsystem is NOT black boxed 
//------------------------------------------------------------------------------
`ifndef FV_KIT_BLACK_BOX_SRAM_SUBSYSTEM


//------------Internal wires & registers------------
wire [31:0] r_data_other, r_data_macb0, r_data_macb1, r_data_macb2, r_data_macb3; //Read data from voltage island 0
wire  cen_macb0;
wire  cen_macb1;
wire  cen_macb2;
wire  cen_macb3;
wire  cen_other;
reg [31:0] hrdata;
wire        valid_access;
wire	      cen;//chip enable 
wire [31:0]	addr;
wire  [3:0]	wen;
wire	      rd_aphase, wr_aphase;
wire [31:0]	haddr_reg_nxt;
wire  [2:0]	hsize_reg_nxt;
reg  [31:0]	haddr_reg;
reg   [2:0]	hsize_reg;
reg		   reg_cen_other;
reg		   reg_cen_macb0;
reg		   reg_cen_macb1;
reg		   reg_cen_macb2;
reg		   reg_cen_macb3;
reg		   RW_conf_dphase;
reg 	      rd_dphase;
reg 		   wr_dphase;

		

//--------------------Code------------------------

// Detect when there is a Read conflicting with the second cycle of a write 
// ------------------------------------------------------------------------
assign RWconflict = ~hwrite & valid_access &  wr_dphase;


// Delay the RWconflict signal by one cycle so that it corresponds to the Dphase of the Read
// ------------------------------------------------------------------------
always @(posedge hclk or negedge n_hreset)
  begin
     if (~n_hreset)
       begin
	  RW_conf_dphase <= 1'b0;
       end 
     else 
       begin    // Register valid read accesses to a group
	  RW_conf_dphase <= RWconflict;
       end
  end
 
   
// Detect valid reads to the memory groups
// ---------------------------------------		 
assign rd_aphase = ~hwrite & valid_access ;
assign wr_aphase =  hwrite & valid_access ;


// Indicate Dphase of reads & writes to various groups
// ------------------------------------------
always @(posedge hclk or negedge n_hreset)
  begin
     if (~n_hreset)
       begin
	  rd_dphase <= 1'b0;
	  wr_dphase <= 1'b0;
       end 
     else 
       begin    // Register valid read accesses to a group
	  rd_dphase <= rd_aphase;
	  wr_dphase <= wr_aphase;
        end
  end


// Store access Addr and Size info
// -------------------------------

// Always store in Aphase of a write
// Also store in Aphase of a read that has a RWconflict

assign haddr_reg_nxt = (valid_access & (hwrite | RWconflict)) ? haddr : haddr_reg;
assign hsize_reg_nxt = (valid_access & (hwrite | RWconflict)) ? hsize : hsize_reg;

always @(posedge hclk or negedge n_hreset)
  begin
if (~n_hreset)
  begin
     haddr_reg <= 32'b0;
     hsize_reg <= 3'b0;
  end 
else
  begin
     haddr_reg <= haddr_reg_nxt;
     hsize_reg <= hsize_reg_nxt;
  end
  end // always @ (posedge hclk or negedge n_hreset)


// Register cens various groups
// ------------------------------------------
always @(posedge hclk or negedge n_hreset)
  begin
     if (~n_hreset)
       begin
	  reg_cen_other <= 1'b1;
	  reg_cen_macb0 <= 1'b1;
	  reg_cen_macb1 <= 1'b1;
	  reg_cen_macb2 <= 1'b1;
	  reg_cen_macb3 <= 1'b1;
       end 
     else 
       begin    // Register read CENs to drive the output mux in the Data phase of reads
	  reg_cen_other <= cen_other | wr_dphase;
	  reg_cen_macb0 <= cen_macb0 | wr_dphase;
	  reg_cen_macb1 <= cen_macb1 | wr_dphase;
	  reg_cen_macb2 <= cen_macb2 | wr_dphase;
	  reg_cen_macb3 <= cen_macb3 | wr_dphase;
        end
  end


// AHB read data
// ------------------------------------------
always @(*) 
begin
 if (~reg_cen_other)
   hrdata = r_data_other;
 else if (~reg_cen_macb0) 
   hrdata = r_data_macb0;
 else if (~reg_cen_macb1) 
   hrdata = r_data_macb1;
 else if (~reg_cen_macb2) 
   hrdata = r_data_macb2;
 else if (~reg_cen_macb3) 
   hrdata = r_data_macb3;
 else 
   hrdata = 32'h0;

end
//assign hrdata = (reg_cen_other | wr_dphase) ? 32'h0 : r_data;

en_gen i_en_gen(
       //inputs
        .haddr(haddr),
        .haddr_reg(haddr_reg),
        .hsize(hsize),
	     .hsize_reg(hsize_reg),
        .wr_dphase(wr_dphase),
	     .rd_aphase(rd_aphase),
	     .rd_dphase(rd_dphase),
	     .RW_conf_dphase(RW_conf_dphase),
       //Outputs
	     .cen(cen),
	     .wen(wen),
	     .SRAM_addr(addr)
);
 
sram_response_gen i_sram_response_gen(
     	   //Inputs
    		.hclk(hclk),         		// AHB Clock
    		.n_hreset(n_hreset),     	// AHB reset - Active low
    		.hsel(hsel),         		// AHB select
    		.htrans(htrans),       		// Transfer type
    		.hsize(hsize),        		// AHB Access type - byte, half-word, word
         .hready_in(hready_in),    	// Combined hready across all slaves
		   .RWconflict(RWconflict),
    	   // Outputs
    		.hready(hready),       		// Ready for new bus cycle from target slave
    		.hresp(hresp),       		// Response from the bridge
         .valid_access(valid_access)
); 


assign cen_macb0 = ~((~cen) && (addr[17:15] == 3'b000));
assign cen_macb1 = ~((~cen) && (addr[17:15] == 3'b001));
assign cen_macb2 = ~((~cen) && (addr[17:15] == 3'b010));
assign cen_macb3 = ~((~cen) && (addr[17:15] == 3'b011));
assign cen_other = ~((~cen) && (addr[17:17] == 1'b1));


generic_sram_32k_wrapper i_macb0_ram
  (.clk  (hclk),
   .gate_mem (~clk_SRPG_macb0_en),
   .n_cs (1'b0),
   .n_we ((cen_macb0 | (&wen))),
   .n_oe (1'b0),
   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
   .ad   (addr[14:2]),
   .din  (hwdata),
   .dout (r_data_macb0)
   );

generic_sram_32k_wrapper i_macb1_ram
  (.clk  (hclk),
   .gate_mem (~clk_SRPG_macb1_en),
   .n_cs (1'b0),
   .n_we ((cen_macb1 | (&wen))),
   .n_oe (1'b0),
   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
   .ad   (addr[14:2]),
   .din  (hwdata),
   .dout (r_data_macb1)
   );

generic_sram_32k_wrapper i_macb2_ram
  (.clk  (hclk),
   .gate_mem (~clk_SRPG_macb2_en),
   .n_cs (1'b0),
   .n_we ((cen_macb2 | (&wen))),
   .n_oe (1'b0),
   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
   .ad   (addr[14:2]),
   .din  (hwdata),
   .dout (r_data_macb2)
   );

generic_sram_32k_wrapper i_macb3_ram
  (.clk  (hclk),
   .gate_mem (~clk_SRPG_macb3_en),
   .n_cs (1'b0),
   .n_we ((cen_macb3 | (&wen))),
   .n_oe (1'b0),
   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
   .ad   (addr[14:2]),
   .din  (hwdata),
   .dout (r_data_macb3)
   );


// Top half
generic_sram_128k_wrapper i_shared_ram
  (.clk  (hclk),
   .n_cs (1'b0),
   .n_we ((cen_other | (&wen))),
   .n_oe (1'b0),
   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
   .ad   (addr[16:2]),
   .din  (hwdata),
   .dout (r_data_other)
   );


//generic_sram_bit #(32, 262144, 18) i_ram
//  (.clk  (hclk),
//   .n_cs (1'b0),
//   .n_we ((cen | (&wen))),
//   .n_oe (1'b0),
//   .mask ( {{8 {wen[3]}},{8{wen[2]}},{8{wen[1]}},{8{wen[0]}}} ),
//   .ad   (addr[19:2]),
//   .din  (hwdata),
//   .dout (r_data)
//   );



`else  // FV_KIT_BLACK_BOX_SRAM_SUBSYSTEM
//------------------------------------------------------------------------------
// if the SRAM subsystem is black boxed 
//------------------------------------------------------------------------------

 // Inputs     
    // system signals
    wire         hclk;     // AHB Clock
    wire         n_hreset;  // AHB reset - Active low
    // AHB interface 
    wire         hsel;     // AHB2APB select
    wire  [31:0] haddr;    // Address bus
    wire  [1:0]  htrans;   // Transfer type
    wire  [2:0]  hsize;    // AHB Access type - byte, half-word, word
    wire  [31:0] hwdata;   // Write data
    wire         hwrite;   // Write signal
    wire         hready_in;// Indicates that last master has finished bus access
    wire  [2:0]  hburst;
    wire  [3:0]  hprot;
    wire  [3:0]  hmaster;
    wire         hmastlock;
    // Scan wire s
    wire         scan_mode; // Scan mode for controlling test muxing
    // reg   s
    // AHB interface
    reg    [31:0] hrdata;       // Read data provided from target slave
    reg           hready;       // Ready for new bus cycle from target slave
    reg    [1:0]  hresp;        // Response from the bridge


`endif  // FV_KIT_BLACK_BOX_SRAM_SUBSYSTEM
//------------------------------------------------------------------------------
// black boxed defines 
//------------------------------------------------------------------------------

endmodule //module sram_subsystem


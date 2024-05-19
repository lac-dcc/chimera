// This program was cloned from: https://github.com/ptracton/AXI_BFM
// License: MIT License

//                              -*- Mode: Verilog -*-
// Filename        : axi_slave_generic.v
// Description     : AXI Slave 
// Author          : Philip Tracton
// Created On      : Fri Dec  9 17:40:03 2016
// Last Modified By: Philip Tracton
// Last Modified On: Fri Dec  9 17:40:03 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

module axi_slave_generic (/*AUTOARG*/
   // Outputs
   awready, wready, bid, bresp, bvalid, arready, rid, rdata, rresp,
   rlast, rvalid,
   // Inputs
   aclk, aresetn, awid, awadr, awlen, awsize, awburst, awlock,
   awcache, awprot, awvalid, wid, wrdata, wstrb, wlast, wvalid,
   bready, arid, araddr, arlen, arsize, arlock, arcache, arprot,
   arvalid, rready
   ) ;

   //
   // Global Signals
   //
   input wire aclk;
   input wire aresetn;   //Active LOW
   
   //
   // Write Address Channel
   //
   input wire [3:0]  awid;    // Address Write ID
   input wire [31:0] awadr;   // Write Address
   input wire [3:0]  awlen;   // Burst Length
   input wire [2:0]  awsize;  // Burst Size
   input wire [1:0]  awburst; // Burst Type
   input wire [1:0]  awlock;  // Lock Type
   input wire [3:0]  awcache; // Cache Type
   input wire [2:0]  awprot;  // Protection Type
   input wire        awvalid; // Write Address Valid
   output reg        awready; // Write Address Ready

   //
   // Write Data Channel
   //
   input wire [3:0]  wid;     // Write ID
   input wire [31:0] wrdata;  // Write Data
   input wire [3:0]  wstrb;   // Write Strobes
   input wire        wlast;   // Write Last
   input wire        wvalid;  // Write Valid
   output reg        wready;  // Write Ready
   
   //
   // Write Response CHannel
   //
   output reg [3:0]  bid;    // Response ID
   output reg [1:0]  bresp;  // Write Response
   output reg        bvalid; // Write Response Valid
   input wire        bready; // Response Ready
   
   //
   // Read Address Channel
   //
   input wire [3:0]  arid;    // Read Address ID
   input wire [31:0] araddr;  // Read Address
   input wire [3:0]  arlen;   // Burst Length
   input wire [2:0]  arsize;  // Burst Size
   input wire [1:0]  arlock;  // Lock Type
   input wire [3:0]  arcache; // Cache Type
   input wire [2:0]  arprot;  // Protection Type
   input wire        arvalid; // Read Address Valid
   output reg        arready; // Read Address Ready

   //
   // Read Data Channel
   //
   output reg [3:0]  rid;     // Read ID
   output reg [31:0] rdata;   // Read Data
   output reg [1:0]  rresp;   // Read Response
   output reg        rlast;   // Read Last
   output reg        rvalid;  // Read Valid
   input  wire       rready;  // Read Ready

   //
   // Internal Signals
   //
   reg [31:0] memory [0:128];
   integer    i;
   
   //
   // Write Address Channel
   //
   reg [31:0]        write_address;
   reg [2:0]         write_size;

   always @(posedge aclk)
     if (~aresetn) begin
        write_address <= 0;   
        awready <= 1;
        write_size <= 0;        
     end else begin
        if (awvalid) begin
           write_address <= {2'b00, awadr[31:2]};
           awready <= 1;
        end else begin
           awready <= 0;           
        end
     end // else: !if(~aresetn)

   //
   // Write Burst Counting
   //

   always @(posedge aclk)
     if (~aresetn) begin
        write_size <= 0;        
     end else begin
        if (awvalid) begin
           write_size <= awsize;                      
        end
     end
   
   //
   // Write Data Channel
   //
   reg [31:0] write_data;
   reg [3:0]  write_strobe;   
   always @(posedge aclk)
     if (~aresetn) begin
        write_data <= 0;
        wready <= 1;       
        write_strobe <= 0;        
     end else begin
        if (wvalid) begin
           write_data <= wrdata;
           wready <= 1;  
           write_strobe <= wstrb;           
        end else begin
           wready <= 0;           
        end
     end

   //
   // Write Response Channel
   // 
   always @(posedge aclk)
     if (~aresetn) begin
        bid <= 0;
        bresp <= `AXI_RESPONSE_OKAY;
        bvalid <= 0;        
     end else begin
        if (bready & wlast) begin
           bvalid <= 1;           
        end else begin
           bvalid <= 0;        
        end
     end

   //
   // Read Address Channel
   //
   reg [31:0] read_address;   
   always @(posedge aclk)
     if (~aresetn) begin
        read_address <= 0;  
        arready <= 0; 
     end else begin
        if (arvalid) begin
           read_address <= {2'b00, araddr[31:2]};           
           arready <= 1;
        end else begin
           arready <= 0;           
        end
     end // else: !if(~aresetn)   
   
   //
   // Read Data Channel
   //
   always @(posedge aclk)
     if (~aresetn) begin
        rdata <= 0;
        rvalid <= 0;
        rresp <= `AXI_RESPONSE_OKAY;   
        rlast <= 0;        
     end else begin
        if (rready) begin
           rdata <= memory[read_address];
           rvalid <= 1;           
        end else begin
           rdata <= 0;
           rvalid <= 0;                      
        end
     end

   
   //
   // Memory Operations
   //
   
   // Memory Write
   always @(posedge aclk) begin
      if (wready) begin
         case (write_strobe)
           4'b0001: memory[write_address] <= {memory[write_address][31:8],  write_data[7:0]};
           4'b0010: memory[write_address] <= {memory[write_address][31:16],  write_data[15:8], memory[write_address][7:0]};
           4'b0100: memory[write_address] <= {memory[write_address][31:24],  write_data[23:16], memory[write_address][15:0]};
           4'b1000: memory[write_address] <= {write_data[31:24], memory[write_address][23:0]};
           4'b0011: memory[write_address] <= {write_data[31:16], memory[write_address][15:0]};
           4'b1100: memory[write_address] <= {memory[write_address][31:16], write_data[15:0]};
           4'b1111: memory[write_address] <= write_data[31:0];
         endcase // case (write_strobe)
      end // if (wready)      
   end
   
endmodule // axi_slave_generic

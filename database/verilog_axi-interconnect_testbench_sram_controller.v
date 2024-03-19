module sram_controller(
input aclk,
input areset,

// AXI 
// AW CHANNEL
input       [3:0]  awid,
input      [31:0]  awaddr,
input       [3:0]  awlen,
input       [2:0]  awsize,
input       [1:0]  awburst,
input       [1:0]  awlock,
input       [3:0]  awcache,
input       [2:0]  awprot,
input              awvalid,
output reg         awready,

// WDATA CHANNEL
input       [3:0]  wid,
input      [31:0]  wdata,
input       [3:0]  wstrb,
input              wlast,
input              wvalid,
output reg         wready,

// RESPNSE CHANNEL
output reg  [3:0]  bid,
output reg  [1:0]  bresp,
output reg         bvalid,
input              bready,

// AR CHANNEL
input       [3:0]  arid,
input      [31:0]  araddr,
input       [3:0]  arlen,
input       [2:0]  arsize,
input       [1:0]  arburst,
input       [1:0]  arlock,
input       [3:0]  arcache,
input       [2:0]  arprot,
input              arvalid,
output reg         arready,

// RDATA CHANNEL
output reg  [3:0]  rid,
output reg [31:0]  rdata,
output reg  [1:0]  rresp,
output reg         rlast,
output reg         rvalid,
input              rready,

// SRAM
output reg  [9:0]  addr,
input      [31:0]  din,
output reg [31:0]  dout,
output reg         we
);

// registers
reg         [3:0]  awid_i;
reg         [9:0]  awaddr_i;
reg         [3:0]  awlen_i;
reg         [2:0]  awsize_i;
reg         [1:0]  awburst_i;
reg         [1:0]  awlock_i;
reg         [3:0]  awcache_i;
reg         [2:0]  awprot_i;

reg         [3:0]  arid_i;
reg         [9:0]  araddr_i;
reg         [3:0]  arlen_i;
reg         [2:0]  arsize_i;
reg         [1:0]  arburst_i;
reg         [3:0]  arcache_i;
reg         [1:0]  arlock_i;
reg         [2:0]  arprot_i;
reg         [3:0]  bid_i;
reg         [1:0]  bresp_i;

reg         [3:0]  rid_i;
reg         [1:0]  rresp_i;
reg                rlast_i;
reg                rvalid_i;

reg                read;
reg                read_s;
reg         [9:0]  sc_r;
reg         [9:0]  sc_w;
reg                last_r;
reg                last_w;


// AW Channel
always @ (posedge aclk or negedge areset) begin 
   if(!areset) begin
      // reset
      awready <= 1'b1;
      wready  <= 1'b0;
   end else begin
   
      // transaction ready
      if(awvalid&awready) begin
         awaddr_i  <= awaddr[9:0];
         awid_i    <= awid[3:0];
         awlen_i   <= awlen[3:0];
         awburst_i <= awburst[1:0];
         awsize_i  <= awsize[2:0];
         awlock_i  <= awlock[1:0];
         awprot_i  <= awprot[2:0];
         awcache_i <= awcache[3:0];
         awready   <= 1'b0;
         wready    <= 1'b1;
      end 
	  
	  // last
	  else if(wlast) begin
         awready  <= 1'b1;
         wready   <= 1'b0;
      end else;
   end 
end

// AR Channel
always @ (posedge aclk or negedge areset) begin
   if(!areset) begin // reset
      arready <= 1'b1;
      read    <= 1'b0; 
   end else begin
      
	  // transaction ready
      if(arvalid&arready) begin
         araddr_i  <= araddr[9:0];
         arid_i    <= arid[3:0];
         arlen_i   <= arlen[3:0];
         arburst_i <= arburst[1:0];
         arsize_i  <= arsize[2:0];
         arlock_i  <= arlock[1:0];
         arprot_i  <= arprot[2:0];
         arcache_i <= arcache[3:0];
         arready   <= 1'b0;

         read      <= 1'b1;
      end 
	  
	  // last
	  else if(arlen_i[3:0]==sc_r[3:0]) begin 
         read <= 1'b0;
         arready <= 1'b1;
      end else;
   end 
end

// RDATA Channel
always @ (posedge aclk or negedge areset) begin 
   if(!areset) begin // reset
      rid      <= 4'bz;
      rid_i    <= 4'bz;
      rdata    <= 32'bz;
      rresp_i  <= 2'bz;
      rresp_i  <= 2'bz;
      rlast    <= 1'b0;
      rvalid   <= 1'b0;
      rvalid_i <= 1'b0;
   end else begin
   
      // read, read after 1 cycle
      if(read_s) begin 
         rvalid <= rvalid_i;
         rid    <= rid_i;
         rdata  <= din;
         rresp  <= rresp_i;
         rlast  <= rlast_i;

         rvalid_i     <= 1'b1;
         rid_i        <= arid_i;
         rresp_i[1:0] <= 2'b0;
         rlast_i      <= last_r;
      end 
	  // if there are no input values
	  else begin
         rvalid <= rvalid_i;
         rid    <= rid_i;
         rdata  <= din;
         rresp  <= rresp_i;
         rlast  <= rlast_i;

         rvalid_i <= 1'b0;
      end
   end //reset 
end //always

// WRESPONSE Channel
always @ (posedge aclk or negedge areset) begin 
   if(!areset) begin // reset
      bid    <= 4'bz;
      bresp  <= 2'bz;
      bvalid <= 1'b0;
   end else begin
   
      // send write response at wlast
      if(last_w) begin 
         bid    <= bid_i;
         bresp  <= bresp_i;
         bvalid <= 1'b1;
      end 
	  else if(bready) begin
         bid    <= 4'bz;
         bresp  <= 2'bz;
         bvalid <= 1'b0;
      end else ;
   end
end

// WDATA Channel / LOCAL SRAM
always @ (posedge aclk or negedge areset) begin 
   if(!areset) begin // reset
      addr   <= 10'b0;
      dout   <= 32'bz;

      we     <= 1'b1;
      sc_w   <= 10'b0;
      sc_r   <= 10'b0;
      read_s <= 1'b0;
      last_r <= 1'b0;
      last_w <= 1'b0;
   end else begin
   
      // write transaction ready
      if(wvalid&wready) begin 
	  
	     // last write sequence
         if(wlast) begin
		 
            case(awburst_i)  // burst mode
               2'b00 : begin // fixed
                  we      <= 1'b0;
                  addr    <= awaddr_i[9:0];
                  dout    <= wdata[31:0];
                  sc_w    <= 10'b0;
                  read_s  <= 1'b0;
                  last_r  <= 1'b0;
                  last_w  <= 1'b1;

                  bid_i   <= awid_i;
                  bresp_i <= 2'b0;
               end
			   
               2'b01 : begin // increment
                  we      <= 1'b0;
                  addr    <= awaddr_i[9:0] + sc_w[9:0];
                  dout    <= wdata[31:0];
                  sc_w    <= 10'b0;
                  read_s  <= 1'b0;
                  last_r  <= 1'b0;
                  last_w  <= 1'b1;

                  bid_i   <= awid_i;
                  bresp_i <= 2'b0;
               end
			   
               2'b10 : begin // wrap

               end
               2'b11 : begin //reserved

               end
               default : ;
            endcase
         end 
		 
		 // not last write sequence
		 else begin 
		 
            case(awburst_i)  // burst
               2'b00 : begin // fixed
                  we     <= 1'b0;
                  addr   <= awaddr_i[9:0];
                  dout   <= wdata[31:0];
                  sc_w   <= sc_w + 1'b1;
                  read_s <= 1'b0;
                  last_r <= 1'b0;
                  last_w <= 1'b0;
               end
			   
               2'b01 : begin // increment
                  we     <= 1'b0;
                  addr   <= awaddr_i[9:0] + sc_w[9:0];
                  dout   <= wdata[31:0];
                  sc_w   <= sc_w + 1'b1;
                  read_s <= 1'b0;
                  last_r <= 1'b0;
                  last_w <= 1'b0;
               end
			   
               2'b10 : begin // wrap

               end
               2'b11 : begin //reserved

               end
               default : ; // awburst
            endcase
         end
		 
      // read transaction ready
      end else if(read) begin
	  
	     // last read sequence
         if(arlen_i[3:0]==sc_r[3:0]) begin 
		 
            case(arburst_i)  // burst mode
               2'b00 : begin // fixed
                  we     <= 1'b1;
                  addr   <= araddr_i;
                  dout   <= 32'bz;
                  sc_r   <= 10'b0;
                  read_s <= 1'b1;
                  last_r <= 1'b1;
                  last_w <= 1'b0;
               end
				  
               2'b01 : begin // increment
                  we     <= 1'b1;
                  addr   <= araddr_i + sc_r;
                  dout   <= 32'bz;
                  sc_r   <= 10'b0;
                  read_s <= 1'b1;
                  last_r <= 1'b1;
                  last_w <= 1'b0;
               end
				  
               2'b10 : begin // wrap
               end
				  
               2'b11 : begin // reserved
               end
			   
               default : ;
            endcase
			
	     // not last read sequence
         end else begin
            case(arburst_i)  // burst mode
               2'b00 : begin // fixed
                  we     <= 1'b1;
                  addr   <= araddr_i;
                  dout   <= 32'bz;
                  sc_r   <= sc_r + 1'b1;
                  read_s <= 1'b1;
                  last_r <= 1'b0;
                  last_w <= 1'b0;
               end
			   
               2'b01 : begin // increment
                  we     <= 1'b1;
                  addr   <= araddr_i + sc_r;
                  dout   <= 32'bz;
                  sc_r   <= sc_r + 1'b1;
                  read_s <= 1'b1;
                  last_r <= 1'b0;
                  last_w <= 1'b0;
               end
			   
               2'b10 : begin // wrap
               end
			   
               2'b11 : begin // reserved
               end
			   
               default : ;
            endcase
         end
      
	  // idle
      end else begin
         we     <= 1'b1;
         read_s <= 1'b0;
         last_r <= 1'b0;
         last_w <= 1'b0;
      end // read/write
   end // areset
end // always

endmodule

module addr_wdata_demux_1to2(
input           aclk,
input           areset,

//
// master
//

// write address
input   [31:0]  awaddr_m,
input    [3:0]  awid_m,
input    [1:0]  awburst_m,
input    [3:0]  awlen_m,
input    [2:0]  awsize_m,
input    [1:0]  awlock_m,
input    [3:0]  awcache_m,
input    [2:0]  awprot_m,
input           awvalid_m,
output          awready_m,

// write data
input    [3:0]  wid_m,
input   [31:0]  wdata_m,
input    [3:0]  wstrb_m,
input           wlast_m,
input           wvalid_m,
output          wready_m,

//
// slave 1
//

// write address
output  [31:0]  awaddr_s1,
output   [3:0]  awid_s1,
output   [1:0]  awburst_s1,
output   [3:0]  awlen_s1,
output   [2:0]  awsize_s1,
output   [1:0]  awlock_s1,
output   [3:0]  awcache_s1,
output   [2:0]  awprot_s1,
output          awvalid_s1,
input           awready_s1,

output   [3:0]  wid_s1,
output  [31:0]  wdata_s1,
output   [3:0]  wstrb_s1,
output          wlast_s1,
output          wvalid_s1,
input           wready_s1,

//
// slave 2
//

// write address
output  [31:0]  awaddr_s2,
output   [3:0]  awid_s2,
output   [1:0]  awburst_s2,
output   [3:0]  awlen_s2,
output   [2:0]  awsize_s2,
output   [1:0]  awlock_s2,
output   [3:0]  awcache_s2,
output   [2:0]  awprot_s2,
output          awvalid_s2,
input           awready_s2,

// write data
output   [3:0]  wid_s2,
output  [31:0]  wdata_s2,
output   [3:0]  wstrb_s2,
output          wlast_s2,
output          wvalid_s2,
input           wready_s2
);

reg             aw_port;  // select which slave we write to
reg      [1:0]  aw_state; // write state
wire            pass_adrs = (aw_state==2'b00) | (aw_state==2'b01);
wire            pass_data = (aw_state==2'b00) | (aw_state==2'b10);

// AW WDATA channel arbiter
always @ (posedge aclk or negedge areset) begin 
   if (!areset) begin // reset
      aw_port  <= 1'b0;
      aw_state <= 2'b00;
   end else begin

      case (aw_state)
         2'b00 : begin // no address or data passed
                    if (aw_port) begin
                       // slave 2
                       // if write address requested
                       if (awvalid_m & awready_s2)
                          aw_state <= 2'b10;
                       else
                          aw_state <= 2'b00;

                    end else begin
                       // slave 1
                       // if write address requested
                       if (awvalid_m & awready_s1)
                          aw_state <= 2'b10;
                       else
                          aw_state <= 2'b00;
                    end
                 end

         2'b01 : ;     // data passed

         2'b10 : begin // address passed

                    // last data passed s2. reset state cycle
                    if (aw_port) begin
                       if (wvalid_m & wready_s2 & wlast_m)
                          aw_state <= 2'b00;
                       else;

                    // last data passed s1. reset state cycle
                    end else begin
                       if (wvalid_m & wready_s1 & wlast_m) 
                          aw_state <= 2'b00;
                       else;
                    end
                end

         default ;
      endcase // aw_state
   end // aclk
end // always

// Write port select
always @ (awvalid_m) begin
   // select port from decoding address
   if (awvalid_m)
      aw_port <= awaddr_m[10];
   else;
end

// AW Demux
assign awaddr_s1  = awaddr_m;
assign awlen_s1   = awlen_m;
assign awsize_s1  = awsize_m;
assign awid_s1    = awid_m;
assign awburst_s1 = awburst_m;
assign awcache_s1 = awcache_m;
assign awlock_s1  = awlock_m;
assign awprot_s1  = awprot_m;

assign awaddr_s2  = awaddr_m;
assign awlen_s2   = awlen_m;
assign awsize_s2  = awsize_m;
assign awid_s2    = awid_m;
assign awburst_s2 = awburst_m;
assign awcache_s2 = awcache_m;
assign awlock_s2  = awlock_m;
assign awprot_s2  = awprot_m;

assign awvalid_s1 = aw_port ? 1'b0 : (awvalid_m & pass_adrs);
assign awvalid_s2 = aw_port ? (awvalid_m & pass_adrs) : 1'b0;
assign awready_m  = aw_port ? (awready_s1 & pass_adrs) : (awready_s2 & pass_adrs);

// WDATA Demux
assign wdata_s1   = wdata_m;
assign wstrb_s1   = wstrb_m;
assign wlast_s1   = wlast_m;
assign wid_s1     = wid_m;

assign wdata_s2   = wdata_m;
assign wstrb_s2   = wstrb_m;
assign wlast_s2   = wlast_m;
assign wid_s2     = wid_m;

assign wvalid_s1  = aw_port ? 1'b0 : (wvalid_m & pass_data);
assign wvalid_s2  = aw_port ? (wvalid_m & pass_data) : 1'b0;
assign wready_m   = aw_port ? (wready_s2 & pass_data) : (wready_s1 & pass_data);

endmodule

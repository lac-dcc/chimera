module addr_wdata_mux_m4(
input aclk,
input areset,

// master 1
input   [31:0]  awaddr_m1,
input    [3:0]  awid_m1,
input    [1:0]  awburst_m1,
input    [3:0]  awlen_m1,
input    [2:0]  awsize_m1,
input    [1:0]  awlock_m1,
input    [3:0]  awcache_m1,
input    [2:0]  awprot_m1,
input           awvalid_m1,
output          awready_m1,
input    [3:0]  wid_m1,
input   [31:0]  wdata_m1,
input    [3:0]  wstrb_m1,
input           wlast_m1,
input           wvalid_m1,
output          wready_m1,

// master 2
input   [31:0]  awaddr_m2,
input    [3:0]  awid_m2,
input    [1:0]  awburst_m2,
input    [3:0]  awlen_m2,
input    [2:0]  awsize_m2,
input    [1:0]  awlock_m2,
input    [3:0]  awcache_m2,
input    [2:0]  awprot_m2,
input           awvalid_m2,
output          awready_m2,
input    [3:0]  wid_m2,
input   [31:0]  wdata_m2,
input    [3:0]  wstrb_m2,
input           wlast_m2,
input           wvalid_m2,
output          wready_m2,

// master 3
input   [31:0]  awaddr_m3,
input    [3:0]  awid_m3,
input    [1:0]  awburst_m3,
input    [3:0]  awlen_m3,
input    [2:0]  awsize_m3,
input    [1:0]  awlock_m3,
input    [3:0]  awcache_m3,
input    [2:0]  awprot_m3,
input           awvalid_m3,
output          awready_m3,
input    [3:0]  wid_m3,
input   [31:0]  wdata_m3,
input    [3:0]  wstrb_m3,
input           wlast_m3,
input           wvalid_m3,
output          wready_m3,

// master 4
input   [31:0]  awaddr_m4,
input    [3:0]  awid_m4,
input    [1:0]  awburst_m4,
input    [3:0]  awlen_m4,
input    [2:0]  awsize_m4,
input    [1:0]  awlock_m4,
input    [3:0]  awcache_m4,
input    [2:0]  awprot_m4,
input           awvalid_m4,
output          awready_m4,
input    [3:0]  wid_m4,
input   [31:0]  wdata_m4,
input    [3:0]  wstrb_m4,
input           wlast_m4,
input           wvalid_m4,
output          wready_m4,

// slave
output  [31:0]  awaddr_s,
output   [3:0]  awid_s,
output   [1:0]  awburst_s,
output   [3:0]  awlen_s,
output   [2:0]  awsize_s,
output   [1:0]  awlock_s,
output   [3:0]  awcache_s,
output   [2:0]  awprot_s,
output          awvalid_s,
input           awready_s,
output   [6:0]  wid_s,
output  [31:0]  wdata_s,
output   [3:0]  wstrb_s,
output          wlast_s,
output          wvalid_s,
input           wready_s,

// select
input    [1:0]  sel
);

reg      [1:0]  aw_port;   // select which slave we write to
reg      [1:0]  aw_state;  // write state

wire            adrs_end = awvalid_s & awready_s;
wire            data_end = wvalid_s & wready_s & wlast_s;
wire            pass_adrs = (aw_state==2'b00) | (aw_state==2'b01);
wire            pass_data = (aw_state==2'b00) | (aw_state==2'b10);


// Address, data channel arbiter
always @ (posedge aclk or negedge areset) begin 
   if (!areset) begin // reset
      aw_port  <= 2'b00;
      aw_state <= 2'b00;
   end else begin

      case (aw_state)
         2'b00 : begin    // no address or data passed
            case ({adrs_end,data_end})
               2'b00 : ;
               2'b01 : aw_state <= 2'b01; // data end
               2'b10 : begin // address end
                          // master 1
                          if (awvalid_m1&(awaddr_m1[12:11]==sel)) begin
                             aw_port  <= 2'b00;
                             aw_state <= 2'b10;
                          end
                          // master 2
                          else if (awvalid_m2&(awaddr_m2[12:11]==sel)) begin
                             aw_port  <= 2'b01;
                             aw_state <= 2'b10;
                          end
                          // master 3
                          else if (awvalid_m3&(awaddr_m3[12:11]==sel)) begin
                             aw_port  <= 2'b10;
                             aw_state <= 2'b10;
                          end
                          // master 4
                          else if (awvalid_m4&(awaddr_m4[12:11]==sel)) begin
                             aw_port  <= 2'b11;
                             aw_state <= 2'b10;
                          end else;
                       end
               2'b11 : aw_state <= 2'b00; // both end
               default;
            endcase
            end

         2'b01 : begin  // data passed
                    if (adrs_end) aw_state <= 2'b00;
                    else;
                 end

         2'b10 : begin // address passed
                    if (data_end) aw_state <= 2'b00;
                    else;
                 end
         default;
      endcase
   end 
end // always

// AW Mux
assign awaddr_s  = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awaddr_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awaddr_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awaddr_m3 : awaddr_m4;
assign awlen_s   = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awlen_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awlen_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awlen_m3 : awlen_m4;
assign awsize_s  = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awsize_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awsize_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awsize_m3 : awsize_m4;
assign awid_s    = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? {2'b00,awid_m1} : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? {2'b01,awid_m2} : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? {2'b10,awid_m3} : {2'b11,awid_m4};
assign awburst_s = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awburst_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awburst_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awburst_m3 : awburst_m4;
assign awcache_s = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awcache_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awcache_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awcache_m3 : awcache_m4;
assign awlock_s  = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awlock_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awlock_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awlock_m3 : awlock_m4;
assign awprot_s  = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? awprot_m1 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? awprot_m2 : (awvalid_m3&(awaddr_m3[12:11]==sel)) ? awprot_m3 : awprot_m4;

assign awvalid_s  = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? (awvalid_m1 & pass_adrs) : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? (awvalid_m2 & pass_adrs) : 
      (awvalid_m3&(awaddr_m3[12:11]==sel)) ? (awvalid_m3 & pass_adrs) : (awvalid_m4&(awaddr_m4[12:11]==sel)) ? (awvalid_m4 & pass_adrs) : 1'b0;
assign awready_m1 = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? (awready_s & pass_adrs) : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? 1'b0 : 
      (awvalid_m3&(awaddr_m3[12:11]==sel)) ? 1'b0 : (awvalid_m4&(awaddr_m4[12:11]==sel)) ? 1'b0 : 1'b0;
assign awready_m2 = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? 1'b0 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? (awready_s & pass_adrs) : 
      (awvalid_m3&(awaddr_m3[12:11]==sel)) ? 1'b0 : (awvalid_m4&(awaddr_m4[12:11]==sel)) ? 1'b0 : 1'b0;
assign awready_m3 = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? 1'b0 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? 1'b0 : 
      (awvalid_m3&(awaddr_m3[12:11]==sel)) ? (awready_s & pass_adrs) : (awvalid_m4&(awaddr_m4[12:11]==sel)) ? 1'b0 : 1'b0;
assign awready_m4 = (awvalid_m1&(awaddr_m1[12:11]==sel)) ? 1'b0 : (awvalid_m2&(awaddr_m2[12:11]==sel)) ? 1'b0 : 
      (awvalid_m3&(awaddr_m3[12:11]==sel)) ? 1'b0 : (awvalid_m4&(awaddr_m4[12:11]==sel)) ? (awready_s & pass_adrs) : 1'b0;

// Wdata mux
assign wdata_s   = (aw_port==2'b00) ? wdata_m1 : (aw_port==2'b01) ? wdata_m2 : (aw_port==2'b10) ? wdata_m3 : wdata_m4;
assign wstrb_s   = (aw_port==2'b00) ? wstrb_m1 : (aw_port==2'b01) ? wstrb_m2 : (aw_port==2'b10) ? wstrb_m3 : wstrb_m4;
assign wlast_s   = (aw_port==2'b00) ? wlast_m1 : (aw_port==2'b01) ? wlast_m2 : (aw_port==2'b10) ? wlast_m3 : wlast_m4;
assign wid_s     = (aw_port==2'b00) ? wid_m1 : (aw_port==2'b01) ? wid_m2 : (aw_port==2'b10) ? wid_m3 : wid_m4;
assign wvalid_s  = (aw_state==2'b10) ? ((aw_port==2'b00) ? (wvalid_m1 & pass_data) : (aw_port==2'b01) ? (wvalid_m2 & pass_data) : (aw_port==2'b10) ? (wvalid_m3 & pass_data) : (wvalid_m4 & pass_data)) : 1'b0;
assign wready_m1 = (aw_port==2'b00) ? (wready_s & pass_data) : (aw_port==2'b01) ? 1'b0 : (aw_port==2'b10) ? 1'b0 : 1'b0;
assign wready_m2 = (aw_port==2'b00) ? 1'b0 : (aw_port==2'b01) ? (wready_s & pass_data) : (aw_port==2'b10) ? 1'b0 : 1'b0;
assign wready_m3 = (aw_port==2'b00) ? 1'b0 : (aw_port==2'b01) ? 1'b0 : (aw_port==2'b10) ? (wready_s & pass_data) : 1'b0;
assign wready_m4 = (aw_port==2'b00) ? 1'b0 : (aw_port==2'b01) ? 1'b0 : (aw_port==2'b10) ? 1'b0 : (wready_s & pass_data);


endmodule

module addr_wdata_mux_2to1(
input           aclk,
input           areset,

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
output   [3:0]  wid_s,
output  [31:0]  wdata_s,
output   [3:0]  wstrb_s,
output          wlast_s,
output          wvalid_s,
input           wready_s
);

reg             aw_port;   // port select
reg      [1:0]  aw_state;  // write state

wire            adrs_end = awvalid_s & awready_s;
wire            data_end = wvalid_s & wready_s & wlast_s;
wire            pass_adrs = (aw_state==2'b00) | (aw_state==2'b01);
wire            pass_data = (aw_state==2'b00) | (aw_state==2'b10);

// AW WDATA Channel arbiter
always @ (posedge aclk or negedge areset) begin
   if (!areset) begin // reset
      aw_port  <= 1'b0;
      aw_state <= 2'b00;
   end else begin

      case (aw_state)
         2'b00 : begin // no address or data passed
            case ({adrs_end,data_end})
               2'b00 : ;
               2'b01 : aw_state <= 2'b01; // data passed
               2'b10 : begin // address passed
                          // address from m1
                          if (awvalid_m1) begin
                             aw_port <= 1'b0;
                             aw_state <= 2'b10;
                          end 
                          // from m2
                          else if (awvalid_m2) begin
                             aw_port <= 1'b1;
                             aw_state <= 2'b10;
                          end else;
                       end
               2'b11 : aw_state <= 2'b00; // passed both
               default;
            endcase
            end

         2'b01 : begin // data passed
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

// AW mux
assign awaddr_s   = awvalid_m1 ? awaddr_m1 : awaddr_m2;
assign awlen_s    = awvalid_m1 ? awlen_m1 : awlen_m2;
assign awsize_s   = awvalid_m1 ? awsize_m1 : awsize_m2;
assign awid_s     = awvalid_m1 ? awid_m1 : awid_m2;
assign awburst_s  = awvalid_m1 ? awburst_m1 : awburst_m2;
assign awcache_s  = awvalid_m1 ? awcache_m1 : awcache_m2;
assign awlock_s   = awvalid_m1 ? awlock_m1 : awlock_m2;
assign awprot_s   = awvalid_m1 ? awprot_m1 : awprot_m2;
assign awvalid_s  = awvalid_m1 ? (awvalid_m1 & pass_adrs) : awvalid_m2 ? (awvalid_m2 & pass_adrs) : 1'b0;
assign awready_m1 = awvalid_m1 ? (awready_s & pass_adrs) : awvalid_m2 ? 1'b0 : 1'b0;
assign awready_m2 = awvalid_m1 ? 1'b0 : awvalid_m2 ? (awready_s & pass_adrs) : 1'b0;

// Wdata mux
assign wdata_s   = aw_port ? wdata_m2 : wdata_m1;
assign wstrb_s   = aw_port ? wstrb_m2 : wstrb_m1;
assign wlast_s   = aw_port ? wlast_m2 : wlast_m1;
assign wid_s     = aw_port ? {1'b1,wid_m2} : {1'b0,wid_m1};
assign wvalid_s  = (aw_state==2'b10) ? (aw_port ? (wvalid_m2 & pass_data) : (wvalid_m1 & pass_data)) : 1'b0;
assign wready_m1 = aw_port ? 1'b0 : wready_s & pass_data;
assign wready_m2 = aw_port ? (wready_s & pass_data) : 1'b0;

endmodule

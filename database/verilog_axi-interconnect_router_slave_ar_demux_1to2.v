module ar_demux_1to2(
input areset,

// master
input   [31:0]  araddr_m,
input    [3:0]  arid_m,
input    [1:0]  arburst_m,
input    [3:0]  arlen_m,
input    [2:0]  arsize_m,
input    [1:0]  arlock_m,
input    [3:0]  arcache_m,
input    [2:0]  arprot_m,
input           arvalid_m,
output          arready_m,

// slave 1
output  [31:0]  araddr_s1,
output   [3:0]  arid_s1,
output   [1:0]  arburst_s1,
output   [3:0]  arlen_s1,
output   [2:0]  arsize_s1,
output   [1:0]  arlock_s1,
output   [3:0]  arcache_s1,
output   [2:0]  arprot_s1,
output          arvalid_s1,
input           arready_s1,

// slave 2
output  [31:0]  araddr_s2,
output   [3:0]  arid_s2,
output   [1:0]  arburst_s2,
output   [3:0]  arlen_s2,
output   [2:0]  arsize_s2,
output   [1:0]  arlock_s2,
output   [3:0]  arcache_s2,
output   [2:0]  arprot_s2,
output          arvalid_s2,
input           arready_s2
);


// AR demux
assign araddr_s1  = araddr_m;
assign arid_s1    = arid_m;
assign arlen_s1   = arlen_m;
assign arsize_s1  = arsize_m;
assign arburst_s1 = arburst_m;
assign arlock_s1  = arlock_m;
assign arcache_s1 = arcache_m;
assign arprot_s1  = arprot_m;

assign araddr_s2  = araddr_m;
assign arid_s2    = arid_m;
assign arlen_s2   = arlen_m;
assign arsize_s2  = arsize_m;
assign arburst_s2 = arburst_m;
assign arlock_s2  = arlock_m;
assign arcache_s2 = arcache_m;
assign arprot_s2  = arprot_m;

assign arvalid_s1 = ((araddr_m[10]==1'b0)&arvalid_m) ? arvalid_m : ((araddr_m[10]==2'b1)&arvalid_m) ? 1'b0 : 1'b0;
assign arvalid_s2 = ((araddr_m[10]==1'b0)&arvalid_m) ? 1'b0 : ((araddr_m[10]==2'b1)&arvalid_m) ? arvalid_m : 1'b0;
assign arready_m  = ((araddr_m[10]==1'b0)&arvalid_m) ? arready_s1 : ((araddr_m[10]==2'b1)&arvalid_m) ? arready_s2 : 1'b0;

endmodule

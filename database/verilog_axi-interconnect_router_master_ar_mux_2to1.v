module ar_mux_2to1(
input areset,

// master 1
input   [31:0]  araddr_m1,
input    [3:0]  arid_m1,
input    [1:0]  arburst_m1,
input    [3:0]  arlen_m1,
input    [2:0]  arsize_m1,
input    [1:0]  arlock_m1,
input    [3:0]  arcache_m1,
input    [2:0]  arprot_m1,
input           arvalid_m1,
output          arready_m1,

// master 2
input   [31:0]  araddr_m2,
input    [3:0]  arid_m2,
input    [1:0]  arburst_m2,
input    [3:0]  arlen_m2,
input    [2:0]  arsize_m2,
input    [1:0]  arlock_m2,
input    [3:0]  arcache_m2,
input    [2:0]  arprot_m2,
input           arvalid_m2,
output          arready_m2,

// slave
output  [31:0]  araddr_s,
output   [3:0]  arid_s,
output   [1:0]  arburst_s,
output   [3:0]  arlen_s,
output   [2:0]  arsize_s,
output   [1:0]  arlock_s,
output   [3:0]  arcache_s,
output   [2:0]  arprot_s,
output          arvalid_s,
input           arready_s
);



// AR mux
assign araddr_s	  = arvalid_m1 ? araddr_m1 : araddr_m2;
assign arid_s	  = arvalid_m1 ? arid_m1 : arid_m2;
assign arlen_s	  = arvalid_m1 ? arlen_m1 : arlen_m2;
assign arsize_s	  = arvalid_m1 ? arsize_m1 : arsize_m2;
assign arburst_s  = arvalid_m1 ? arburst_m1 : arburst_m2;
assign arlock_s	  = arvalid_m1 ? arlock_m1 : arlock_m2;
assign arcache_s  = arvalid_m1 ? arcache_m1 : arcache_m2;
assign arprot_s	  = arvalid_m1 ? arprot_m1 : arprot_m2;
assign arvalid_s  = arvalid_m1 ? arvalid_m1 : arvalid_m2 ? arvalid_m2 : 1'b0;

assign arready_m1 = arvalid_m1 ? arready_s : arvalid_m2 ? 1'b0 : 1'b0;

assign arready_m2 = arvalid_m1 ? 1'b0 : arvalid_m2 ? arready_s : 1'b0;

endmodule

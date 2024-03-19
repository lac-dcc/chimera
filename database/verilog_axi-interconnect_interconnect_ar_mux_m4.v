module ar_mux_m4(
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

// master 3
input   [31:0]  araddr_m3,
input    [3:0]  arid_m3,
input    [1:0]  arburst_m3,
input    [3:0]  arlen_m3,
input    [2:0]  arsize_m3,
input    [1:0]  arlock_m3,
input    [3:0]  arcache_m3,
input    [2:0]  arprot_m3,
input           arvalid_m3,
output          arready_m3,

// master 4
input   [31:0]  araddr_m4,
input    [3:0]  arid_m4,
input    [1:0]  arburst_m4,
input    [3:0]  arlen_m4,
input    [2:0]  arsize_m4,
input    [1:0]  arlock_m4,
input    [3:0]  arcache_m4,
input    [2:0]  arprot_m4,
input           arvalid_m4,
output          arready_m4,

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
input           arready_s,

// select
input    [1:0]  sel
);


// AR MUX
assign araddr_s   = ((araddr_m1[12:11]==sel)&arvalid_m1) ? araddr_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? araddr_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? araddr_m3 : araddr_m4;
assign arid_s     = ((araddr_m1[12:11]==sel)&arvalid_m1) ? {2'b00,arid_m1} : ((araddr_m2[12:11]==sel)&arvalid_m2) ? {2'b01,arid_m2} : ((araddr_m3[12:11]==sel)&arvalid_m3) ? {2'b10,arid_m3} : {2'b11,arid_m4};
assign arlen_s    = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arlen_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arlen_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arlen_m3 : arlen_m4;
assign arsize_s   = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arsize_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arsize_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arsize_m3 : arsize_m4;
assign arburst_s  = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arburst_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arburst_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arburst_m3 : arburst_m4;
assign arlock_s   = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arlock_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arlock_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arlock_m3 : arlock_m4;
assign arcache_s  = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arcache_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arcache_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arcache_m3 : arcache_m4;
assign arprot_s   = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arprot_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arprot_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arprot_m3 : arprot_m4;

assign arvalid_s  = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arvalid_m1 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arvalid_m2 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arvalid_m3 : ((araddr_m4[12:11]==sel)&arvalid_m4) ? arvalid_m4 : 1'b0;
assign arready_m1 = ((araddr_m1[12:11]==sel)&arvalid_m1) ? arready_s : ((araddr_m2[12:11]==sel)&arvalid_m2) ? 1'b0 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? 1'b0 : ((araddr_m4[12:11]==sel)&arvalid_m4) ? 1'b0 : 1'b0;
assign arready_m2 = ((araddr_m1[12:11]==sel)&arvalid_m1) ? 1'b0 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? arready_s : ((araddr_m3[12:11]==sel)&arvalid_m3) ? 1'b0 : ((araddr_m4[12:11]==sel)&arvalid_m4) ? 1'b0 : 1'b0;
assign arready_m3 = ((araddr_m1[12:11]==sel)&arvalid_m1) ? 1'b0 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? 1'b0 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? arready_s : ((araddr_m4[12:11]==sel)&arvalid_m4) ? 1'b0 : 1'b0;
assign arready_m4 = ((araddr_m1[12:11]==sel)&arvalid_m1) ? 1'b0 : ((araddr_m2[12:11]==sel)&arvalid_m2) ? 1'b0 : ((araddr_m3[12:11]==sel)&arvalid_m3) ? 1'b0 : ((araddr_m4[12:11]==sel)&arvalid_m4) ? arready_s : 1'b0;

endmodule

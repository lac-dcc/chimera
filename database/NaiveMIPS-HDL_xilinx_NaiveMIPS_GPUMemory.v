`default_nettype wire
module GPUMemory(/*autoport*/
//output
           q_a,
           q_b,
//input
           aclr_a,
           aclr_b,
           address_a,
           address_b,
           clock_a,
           clock_b,
           data_a,
           data_b,
           wren_a,
           wren_b);

input     aclr_a;
input     aclr_b;
input   [13:0]  address_a;
input   [13:0]  address_b;
input     clock_a;
input     clock_b;
input   [31:0]  data_a;
input   [31:0]  data_b;
input     wren_a;
input     wren_b;
output  [31:0]  q_a;
output  [31:0]  q_b;

gpu_mem_xilinx gpu_mem(
  .clka(clock_a),
  .rsta(aclr_a),
  .wea(wren_a),
  .addra(address_a),
  .dina(data_a),
  .douta(q_a),
  .clkb(clock_b),
  .rstb(aclr_b),
  .web(wren_b),
  .addrb(address_b),
  .dinb(data_b),
  .doutb(q_b)
);

endmodule
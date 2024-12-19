// Seed: 1821655155
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wire id_2,
    input wire id_3,
    input uwire id_4,
    input tri1 id_5,
    input wire id_6,
    output supply1 id_7,
    output wire id_8
);
  assign module_1.type_3 = 0;
  integer id_10;
endmodule
module module_1 (
    input  wire id_0,
    output wor  id_1
);
  always_latch @(negedge id_0) #0 id_1 = id_0;
  always @(*) id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  always @(posedge 1) id_1 = 1;
endmodule

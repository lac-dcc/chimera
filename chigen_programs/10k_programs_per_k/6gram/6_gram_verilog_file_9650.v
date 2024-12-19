// Seed: 78362927
module module_0 (
    output tri id_0,
    output wire id_1,
    input uwire id_2,
    output tri id_3,
    output supply1 id_4,
    output uwire id_5,
    input wand id_6,
    output uwire id_7,
    input tri0 id_8,
    output supply1 id_9,
    input wire id_10,
    output wire id_11,
    output wor id_12
);
  always @(posedge 1'b0) force id_3 = 1 == 1;
  wire id_14;
  wire id_15;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wire id_5,
    output tri id_6,
    output tri1 id_7,
    input wand id_8
);
  tri id_10;
  nand primCall (id_5, id_10, id_8, id_3, id_4, id_1);
  assign id_10 = 1'b0 ? id_10 : 1 ? 1 : id_3;
  assign id_5  = &id_2;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_6,
      id_5,
      id_5,
      id_1,
      id_10,
      id_10,
      id_6,
      id_1,
      id_0,
      id_5
  );
endmodule

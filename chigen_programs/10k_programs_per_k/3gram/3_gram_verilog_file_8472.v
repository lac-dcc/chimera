// Seed: 1629976385
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    input wand id_3
);
  wire id_5;
  logic [7:0] id_6;
  assign id_6[1] = 1;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    output uwire id_3,
    output uwire id_4,
    input supply0 id_5,
    output tri id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9,
    output tri id_10,
    input wand id_11,
    input wire id_12,
    input wor id_13,
    output supply0 id_14
);
  assign id_6 = id_7;
  nor primCall (id_4, id_13, id_11, id_5, id_1, id_0, id_12, id_9, id_8, id_7);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_13
  );
  assign modCall_1.type_0 = 0;
  wire id_16;
  integer id_17;
  assign id_6 = id_7;
endmodule

// Seed: 3125342868
module module_0 (
    input wire id_0,
    input wor id_1,
    output uwire id_2,
    output uwire id_3,
    input supply0 id_4,
    output wire id_5,
    input wand id_6,
    output supply0 id_7,
    output supply1 id_8
    , id_12,
    output wand id_9,
    input wor id_10
);
  assign id_12 = id_6;
  assign id_7  = id_6;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    input tri1 id_5,
    output logic id_6,
    input uwire id_7,
    output supply0 id_8,
    input wire id_9,
    input supply0 id_10,
    output supply0 id_11
);
  logic id_13;
  ;
  parameter id_14 = 1;
  generate
    wire id_15;
    parameter id_16 = id_14;
  endgenerate
  xor primCall (id_8, id_0, id_5, id_1, id_10, id_7, id_4, id_14, id_9);
  module_0 modCall_1 (
      id_9,
      id_10,
      id_11,
      id_8,
      id_1,
      id_8,
      id_5,
      id_8,
      id_11,
      id_11,
      id_3
  );
  assign modCall_1.id_2 = 0;
  final id_6 <= id_9;
endmodule

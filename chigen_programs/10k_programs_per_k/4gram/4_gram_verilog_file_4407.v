// Seed: 2116903126
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  wire id_8;
  always_ff @(posedge id_3) if (id_3) id_6 = id_7;
  wire id_9;
  wand id_10 = 1, id_11, id_12, id_13, id_14, id_15;
  tri  id_16 = id_3;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4
);
  wire id_6;
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.type_21 = 0;
  id_7(
      .id_0(id_3), .id_1(id_4)
  );
  tri id_8 = id_4;
endmodule

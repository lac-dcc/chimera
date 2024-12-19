// Seed: 123362270
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    output wire id_10,
    input wor id_11
);
  logic [7:0] id_13;
  assign id_13[1] = 1;
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output wand id_2,
    output supply1 id_3,
    output uwire id_4,
    output supply1 id_5,
    input wire id_6,
    input supply0 id_7,
    output wire id_8,
    output uwire id_9
);
  assign id_9 = id_0;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6,
      id_8,
      id_0,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.type_2 = 0;
  assign id_3 = 1'b0;
endmodule

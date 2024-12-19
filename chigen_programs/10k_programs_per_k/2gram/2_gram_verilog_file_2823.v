// Seed: 2518659494
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wire id_5,
    output supply1 id_6,
    input wor id_7
);
  wire id_9;
  wire id_10 = id_1 - {1{1}};
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    input wand id_9
);
  logic [7:0] id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_6,
      id_6,
      id_8
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_7 + 1;
  assign id_11[1] = id_7;
  assign id_6 = 1;
endmodule

// Seed: 1645802405
module module_0 (
    input wand id_0,
    output tri id_1,
    output supply0 id_2,
    input wand id_3,
    input wor id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7
);
  wire id_9;
  wire id_10;
  tri1 id_11 = 1;
  assign id_11 = id_4;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    input supply1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6
  );
  assign modCall_1.id_2 = 0;
  logic [7:0] id_9;
  assign id_9[1] = 1;
endmodule

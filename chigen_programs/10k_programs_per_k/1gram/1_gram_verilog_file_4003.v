// Seed: 2799410404
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input wire id_4,
    input tri0 id_5,
    input wand id_6,
    input supply1 id_7,
    input tri1 id_8,
    input wor id_9,
    input supply1 id_10,
    output supply0 id_11
);
  assign id_11 = id_9;
  assign id_3  = id_7;
  assign id_11 = id_2#(.id_8(1));
  assign id_3  = 1'b0;
  assign id_0  = id_1;
  tri0 id_13, id_14, id_15;
  assign id_14 = id_7;
  wire id_16, id_17;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    input wand id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5,
      id_4,
      id_2,
      id_5,
      id_3,
      id_1
  );
  assign modCall_1.type_1 = 0;
  assign id_0 = (id_3);
endmodule

// Seed: 768979784
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri id_2,
    input tri0 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    input tri1 id_7,
    input tri1 id_8,
    output tri0 id_9,
    output uwire id_10,
    output tri1 id_11,
    output tri0 id_12,
    input wire id_13,
    input wire id_14
    , id_18,
    input wand id_15,
    output tri0 id_16
);
  wire id_19;
  assign module_1.id_4 = 0;
  wire id_20;
  wire id_21;
  assign id_16 = id_2 == id_13;
endmodule
module module_1 (
    inout  tri0  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output tri0  id_3,
    input  wand  id_4,
    output uwire id_5
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_1,
      id_4,
      id_4,
      id_0
  );
  assign id_0 = 1;
endmodule

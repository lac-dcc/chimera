// Seed: 2470242820
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    input wire id_5,
    output tri0 id_6,
    input wand id_7,
    input supply0 id_8,
    output tri1 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri id_13,
    output tri1 id_14,
    input tri1 id_15
);
  wire id_17;
  assign id_6 = id_10;
  wire id_18;
  wire id_19;
  wire id_20;
  assign id_14 = id_4;
  wor id_21;
  wire id_22, id_23, id_24;
  parameter id_25 = id_21;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    input  tri   id_2
);
  wire id_4, id_5;
  xnor primCall (id_0, id_1, id_2, id_4);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
  wire id_6;
endmodule

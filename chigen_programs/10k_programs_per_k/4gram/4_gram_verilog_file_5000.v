// Seed: 1540495260
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    input tri1 id_2,
    input wor id_3,
    input tri1 id_4,
    input wand id_5,
    output wor id_6,
    input wor id_7,
    input tri id_8,
    input wire id_9,
    output wor id_10,
    output wor id_11,
    input supply1 id_12
);
  wire id_14, id_15;
  assign id_1 = 1 & 1;
  wire id_16;
  tri0 id_17 = 1'h0;
  assign id_0 = id_3;
  wire id_18;
  wire id_19;
  longint id_20 (
      .id_0(id_6),
      .id_1(1),
      .id_2(1),
      .id_3(id_6)
  );
endmodule
module module_1 (
    input  tri  id_0,
    input  tri0 id_1,
    input  wire id_2,
    output tri  id_3,
    output wire id_4
);
  wire id_6;
  always @(posedge 1) id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0,
      id_2,
      id_1,
      id_4,
      id_3,
      id_1
  );
endmodule

// Seed: 2805409959
module module_0 (
    input wor id_0,
    output uwire id_1,
    output tri1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    output tri id_9
    , id_14,
    input tri0 id_10,
    input uwire id_11
    , id_15,
    output wor id_12
);
  wire id_16;
  assign id_2 = 1 ? id_10 : 1 * id_8 << (id_16);
  assign id_1 = id_0;
  wire id_17;
  assign id_3 = 1;
  wire id_18;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input supply1 id_3
    , id_5
);
  logic [7:0] id_6;
  logic [7:0] id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
  assign id_7[-1] = -1'b0 ? id_6 - 1 : 1 * id_1 - id_0;
  assign id_6 = id_0;
endmodule

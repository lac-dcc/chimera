// Seed: 2109001402
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3
    , id_12,
    input tri id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input wire id_9,
    input supply1 id_10
);
  wire id_13;
  assign module_1.type_10 = 0;
  wire id_14;
  wire id_15;
  tri  id_16 = 1;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    inout logic id_2,
    output supply1 id_3,
    input uwire id_4,
    output wand id_5,
    input wor id_6,
    input logic id_7
);
  always @((1) or posedge id_7) id_2 = #id_9 id_0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_6,
      id_1,
      id_6,
      id_4,
      id_4
  );
  always @(posedge 1 or posedge id_6 < 1'b0);
  always_comb #1 id_9 <= 1;
endmodule

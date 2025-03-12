// Seed: 3808240449
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6
    , id_15,
    input wor id_7,
    input wor id_8,
    input wor id_9,
    output wand id_10
    , id_16,
    output supply1 id_11,
    output wor id_12,
    output supply1 id_13
);
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri id_2,
    input uwire id_3
    , id_10,
    input uwire id_4,
    output wor id_5,
    output wor id_6,
    output wor id_7,
    input supply0 id_8
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_1,
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_8,
      id_1,
      id_6,
      id_5,
      id_1
  );
  assign modCall_1.id_7 = 0;
  logic id_11;
  ;
  always_comb @(-1 or 1)
    if ((1)) begin : LABEL_0
      $clog2(94);
      ;
    end else id_10 = -1;
  assign id_7 = 1;
endmodule

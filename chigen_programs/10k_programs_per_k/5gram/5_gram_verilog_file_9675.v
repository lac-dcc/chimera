// Seed: 3113806671
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3,
    input tri id_4,
    output wand id_5,
    output tri1 id_6,
    input wand id_7,
    input wand id_8,
    input wor id_9,
    output supply0 id_10,
    output supply0 id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    output uwire id_16,
    input tri1 id_17,
    output tri id_18,
    input wire id_19,
    input wor id_20
    , id_25,
    input tri id_21,
    input supply0 id_22
    , id_26,
    input tri id_23
);
  assign id_10 = id_14 + 1;
  tri1 id_27;
  assign module_1.id_2 = 0;
  assign id_27 = id_9 != 1 ? id_20 <= id_26[1'd0|1 : 1] : id_20 ? id_3 : id_21;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wand id_5,
    input uwire id_6
);
  reg id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_6,
      id_5,
      id_5,
      id_6,
      id_3,
      id_3,
      id_5,
      id_5,
      id_6,
      id_3,
      id_2,
      id_5,
      id_5,
      id_3,
      id_5,
      id_6,
      id_4,
      id_3,
      id_1,
      id_4
  );
  always_comb @(id_8++) id_8 <= id_3 ? 1'h0 : 0;
  wire id_9;
endmodule

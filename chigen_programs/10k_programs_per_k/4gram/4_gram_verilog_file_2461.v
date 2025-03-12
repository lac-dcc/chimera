// Seed: 353205015
module module_0 (
    output supply1 id_0,
    input tri id_1
);
endmodule
module module_1 (
    output uwire   id_0,
    input  supply1 id_1
);
  always force id_0.id_1 = -1'h0;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
  logic id_3;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_3.id_24 = 0;
  wire id_4;
endmodule
module module_3 #(
    parameter id_13 = 32'd96
) (
    input supply0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    output wor id_6,
    output tri0 id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    output wand id_11,
    input tri id_12,
    input supply0 _id_13,
    input tri0 id_14,
    output wire id_15,
    input wor id_16,
    input tri1 id_17,
    input supply1 id_18,
    input tri0 id_19,
    output wor id_20,
    output wand id_21,
    output uwire id_22,
    input supply1 id_23,
    input uwire id_24
    , id_28,
    output wand id_25,
    input wand id_26
);
  assign id_11 = 1;
  nand primCall (
      id_4,
      id_8,
      id_12,
      id_3,
      id_24,
      id_10,
      id_0,
      id_16,
      id_23,
      id_14,
      id_9,
      id_28,
      id_29,
      id_19,
      id_5,
      id_18
  );
  logic [-1 'h0 : id_13] id_29;
  ;
  module_2 modCall_1 (
      id_29,
      id_29,
      id_28
  );
endmodule

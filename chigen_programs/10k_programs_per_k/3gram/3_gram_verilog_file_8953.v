// Seed: 906238135
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input supply1 id_4,
    output tri0 id_5,
    output uwire id_6,
    input wire id_7
);
  wire id_9;
  ;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    output uwire id_4,
    input supply1 id_5,
    output tri0 id_6
);
  logic id_8;
  xnor primCall (id_6, id_5, id_1, id_8);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_1,
      id_1,
      id_4,
      id_6,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_19 = 32'd92
) (
    output wor id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    input supply0 id_4,
    output wand id_5,
    input tri1 id_6,
    input tri id_7,
    output tri id_8,
    input supply1 id_9,
    input uwire id_10,
    output wor id_11,
    input supply0 id_12
    , id_23,
    output wire id_13,
    input supply1 id_14,
    output tri id_15,
    input tri0 id_16,
    output tri1 id_17,
    input tri id_18,
    input wor _id_19,
    output wor id_20,
    output uwire id_21
);
  wire [-1 'h0 : id_19] id_24 = id_16;
  module_0 modCall_1 (
      id_21,
      id_10,
      id_2,
      id_10,
      id_3,
      id_0,
      id_13,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule

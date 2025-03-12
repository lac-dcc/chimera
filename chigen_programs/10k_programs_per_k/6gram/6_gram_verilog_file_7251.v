// Seed: 3690839124
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output uwire id_2,
    input wand id_3,
    input wor id_4,
    output supply0 id_5,
    input tri id_6,
    input wire id_7
);
  assign id_5 = id_6;
endmodule
module module_1 (
    input  wire  id_0,
    output uwire id_1
);
  uwire id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 #(
    parameter id_4 = 32'd88
) (
    input tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    output tri0 id_3,
    input supply0 _id_4,
    input tri id_5,
    input wand id_6,
    output supply0 id_7,
    input tri id_8,
    output wand id_9,
    output uwire id_10,
    input tri id_11,
    input wor id_12,
    input supply1 id_13,
    input supply1 id_14,
    input wire id_15,
    input tri1 id_16,
    output tri1 id_17,
    output wor id_18,
    input wor id_19,
    input supply1 id_20,
    output tri id_21
);
  wire [id_4 : -1] id_23;
  xnor primCall (
      id_17, id_11, id_20, id_6, id_0, id_14, id_23, id_5, id_12, id_13, id_24, id_16, id_8, id_15
  );
  logic id_24 = 1;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_9,
      id_6,
      id_11,
      id_2,
      id_13,
      id_19
  );
  assign modCall_1.id_6 = 0;
endmodule

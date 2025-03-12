// Seed: 2485646308
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3
);
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    inout  logic id_3
);
  always @(id_1) id_3 = id_1;
  bufif0 primCall (id_2, id_3, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_16 = 32'd64
) (
    input wire id_0,
    output wire id_1,
    input wire id_2,
    input wor id_3,
    output supply1 id_4,
    input tri0 id_5,
    input wire id_6,
    input wor id_7,
    input tri0 id_8,
    input wire id_9,
    input supply0 id_10,
    output wand id_11,
    output tri1 id_12,
    input tri1 id_13,
    input wand id_14,
    output wor id_15,
    output supply0 _id_16,
    input supply1 id_17,
    output tri id_18,
    input wand id_19,
    input wire id_20,
    output supply1 id_21,
    input uwire id_22,
    output uwire id_23,
    output tri id_24
);
  assign id_23 = 1 << !id_8;
  logic [-1 : id_16] id_26;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_12,
      id_15
  );
  assign modCall_1.id_0 = 0;
  logic id_27;
  logic id_28;
  and primCall (
      id_15, id_22, id_6, id_3, id_5, id_0, id_13, id_17, id_19, id_20, id_26, id_7, id_14, id_10
  );
endmodule

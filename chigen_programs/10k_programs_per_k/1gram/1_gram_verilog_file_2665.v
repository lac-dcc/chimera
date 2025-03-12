// Seed: 3453624844
module module_0 (
    input tri id_0,
    output tri0 id_1,
    output uwire id_2,
    input tri id_3,
    input wire id_4,
    input tri0 id_5,
    output tri1 id_6,
    input wire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wor id_11
    , id_26,
    output wire id_12,
    input wand id_13,
    output tri0 id_14,
    input wand id_15,
    input tri0 id_16,
    input wand id_17,
    input tri id_18,
    output tri id_19,
    input wire id_20,
    input uwire id_21,
    output wor id_22,
    output wor id_23,
    input tri id_24
);
  wire  id_27;
  logic id_28;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd5
) (
    output supply0 id_0,
    input  supply0 id_1 [-1 : id_2],
    input  supply1 _id_2,
    output supply1 id_3
);
  assign id_0 = id_2;
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1
  );
endmodule

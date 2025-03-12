// Seed: 2247925708
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    output tri0 id_4,
    input supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    input wire id_8,
    output tri id_9,
    input supply0 id_10,
    input wor id_11,
    output wand id_12,
    output supply1 id_13,
    input tri0 id_14,
    output uwire id_15,
    input wand id_16,
    input supply0 id_17,
    input tri1 id_18,
    output wire id_19,
    input supply1 id_20,
    inout supply1 id_21,
    input wor id_22,
    output tri id_23,
    output uwire id_24
);
  always #(1'b0);
endmodule
module module_1 #(
    parameter id_8 = 32'd15
) (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri0 id_5,
    output wor id_6,
    inout supply0 id_7,
    input supply0 _id_8
);
  wire [-1 'b0 : id_8] id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_3,
      id_7,
      id_4,
      id_2,
      id_5,
      id_5,
      id_2,
      id_6,
      id_7,
      id_0,
      id_4,
      id_1,
      id_2,
      id_1,
      id_5,
      id_3,
      id_7,
      id_4,
      id_3,
      id_7,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_18 = 0;
endmodule

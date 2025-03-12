// Seed: 4265144369
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri id_2,
    input supply0 id_3,
    input wand id_4,
    input tri0 id_5,
    input wand id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wor id_9,
    input uwire id_10,
    input tri id_11,
    input tri id_12,
    input tri0 id_13,
    input wire id_14,
    input wire id_15,
    output tri1 id_16,
    output tri1 id_17,
    output supply0 id_18
);
  wire id_20;
  parameter id_21 = ~1;
endmodule
module module_1 #(
    parameter id_11 = 32'd62
) (
    input supply1 id_0,
    input wand id_1,
    output supply0 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6,
    input supply1 id_7,
    input supply0 id_8
);
  wire id_10;
  wire _id_11;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_5,
      id_8,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_8,
      id_1,
      id_8,
      id_3,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.id_17 = 0;
  wire id_12;
  wire [-1 : id_11] id_13;
  localparam id_14 = -1 - 1;
endmodule

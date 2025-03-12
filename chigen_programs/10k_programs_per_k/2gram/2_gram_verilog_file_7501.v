// Seed: 1561026286
module module_0 (
    input wire id_0,
    output tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input wire id_6,
    input tri1 id_7,
    input supply1 id_8,
    output wand id_9,
    output tri id_10,
    input tri0 id_11,
    output uwire id_12,
    input wor id_13
);
  assign id_10 = id_3;
  wire id_15;
  wire id_16;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd73
) (
    output tri id_0,
    input tri0 _id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input uwire id_7,
    input uwire id_8,
    input wire id_9,
    output supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    output supply0 id_14,
    output supply1 id_15,
    input tri0 id_16,
    input wire id_17
);
  parameter id_19 = -1'b0;
  assign id_14 = id_17;
  wire id_20;
  module_0 modCall_1 (
      id_4,
      id_14,
      id_6,
      id_5,
      id_3,
      id_10,
      id_4,
      id_9,
      id_16,
      id_0,
      id_15,
      id_16,
      id_14,
      id_6
  );
  assign modCall_1.id_4 = 0;
  assign id_0 = id_19;
  logic id_21;
  assign id_14 = id_12;
  xor primCall (
      id_14, id_9, id_17, id_4, id_3, id_16, id_2, id_8, id_19, id_5, id_12, id_13, id_20
  );
  wire [id_1 : -1] id_22;
  assign id_21 = -1;
endmodule

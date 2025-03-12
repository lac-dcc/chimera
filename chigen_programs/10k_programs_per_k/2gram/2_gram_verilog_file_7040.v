// Seed: 373130037
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    output tri1  id_2,
    output uwire id_3
);
  wire id_5;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd59
) (
    input wire id_0,
    output wand id_1,
    input tri0 id_2,
    input uwire id_3,
    inout supply0 id_4,
    output tri id_5,
    input wand _id_6,
    input wor id_7,
    output wire id_8,
    input wire id_9,
    input wor id_10,
    input tri id_11,
    input tri0 id_12,
    input wire id_13,
    input supply1 id_14,
    output logic id_15,
    input tri0 id_16,
    input supply1 id_17,
    input tri0 id_18
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = -1;
  genvar id_20;
  assign id_4  = id_9;
  assign id_15 = id_13 ^ id_18 == id_14 ^ id_11;
  always_latch id_15 = new;
  assign id_5 = id_10;
  wire [1 'h0 : id_6] id_21;
endmodule

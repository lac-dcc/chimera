// Seed: 931202912
module module_0 #(
    parameter id_11 = 32'd0
) (
    input wor id_0,
    output wire id_1,
    output uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output wor id_5,
    output supply0 id_6,
    input uwire id_7,
    input uwire id_8,
    input supply0 id_9,
    input wire id_10,
    input wand _id_11,
    input supply0 id_12,
    output tri0 id_13,
    output uwire id_14,
    output tri id_15,
    input supply1 id_16
);
  wire id_18;
  logic [-1 : id_11] id_19;
  ;
  logic id_20;
  ;
endmodule
module module_0 #(
    parameter id_1 = 32'd4,
    parameter id_7 = 32'd51
) (
    input uwire id_0,
    input uwire _id_1,
    input wor id_2,
    input supply0 module_1,
    input wor id_4,
    output tri0 id_5
);
  localparam id_7 = 1 == 1;
  wire [id_1 : id_7] id_8;
  wire id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  wire id_16;
  nor primCall (id_5, id_14, id_12, id_13, id_17, id_7, id_8, id_15);
  assign id_15 = id_10;
  wire id_17;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_2,
      id_5,
      id_5,
      id_2,
      id_2,
      id_4,
      id_2,
      id_7,
      id_4,
      id_5,
      id_5,
      id_5,
      id_2
  );
  wire id_18;
  assign id_17 = id_16;
endmodule

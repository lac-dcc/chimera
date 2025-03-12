// Seed: 3867274068
module module_0 (
    output supply0 id_0,
    output wire id_1,
    input wand id_2,
    output tri0 id_3,
    output uwire id_4,
    input supply0 id_5,
    output wor id_6,
    input wand id_7,
    input tri1 id_8,
    input uwire id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input supply0 id_13,
    output tri0 id_14,
    output tri id_15,
    input wand id_16,
    output supply1 id_17,
    output uwire id_18,
    output wand id_19
);
  assign module_1.id_6 = 0;
  assign id_15 = id_8 - 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd86
) (
    input wor id_0,
    output uwire id_1,
    input tri1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    output tri id_5,
    input tri id_6,
    input tri0 id_7,
    input uwire id_8,
    input wor id_9,
    input tri id_10,
    input wand _id_11,
    input uwire id_12
);
  logic [-1 'b0 : id_11] id_14;
  union packed {
    logic id_15  = "";
    logic id_16;
    logic id_17;
  } id_18;
  logic id_19;
  supply0 id_20;
  tri1 id_21, id_22, id_23, id_24;
  assign id_20 = 1'b0;
  assign id_21 = -1;
  wire id_25, id_26;
  assign id_19[1'd0] = -1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_0,
      id_4,
      id_9,
      id_3,
      id_9,
      id_4,
      id_7,
      id_3,
      id_5,
      id_8,
      id_3,
      id_1,
      id_5
  );
endmodule

// Seed: 777385591
module module_0 #(
    parameter id_15 = 32'd84
) (
    output supply0 id_0,
    input wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    output uwire id_4,
    output wire id_5
);
  logic [1 : 1 'b0] id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, _id_15, id_16, id_17;
  parameter id_18 = -1, id_19 = 1 <= 1, id_20 = -1;
  assign id_10[id_15] = 1;
  logic id_21;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    output supply0 id_2,
    output tri id_3,
    input tri id_4,
    input supply1 id_5,
    input wire id_6,
    input uwire id_7,
    input wor id_8,
    input wor id_9
);
  uwire id_11 = 1, id_12;
  wire  id_13;
  wire  id_14;
  or primCall (id_2, id_14, id_6, id_11, id_7, id_5, id_13, id_4, id_1);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_15 = 0;
endmodule

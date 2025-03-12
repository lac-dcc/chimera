// Seed: 1752142884
module module_0 (
    input wor id_0,
    input wire id_1,
    input tri0 id_2,
    output wand id_3,
    output tri id_4,
    input supply1 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input tri id_8,
    output wor id_9,
    input tri1 id_10
);
  integer id_12;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd1
) (
    input tri id_0,
    output tri0 id_1,
    output tri0 id_2,
    output wand id_3,
    output uwire id_4,
    input uwire id_5,
    input wor _id_6,
    input tri id_7,
    output wand id_8,
    input wor id_9,
    input wire id_10,
    output tri0 id_11,
    output supply0 id_12
);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_4,
      id_1,
      id_7,
      id_4,
      id_7,
      id_5,
      id_8,
      id_0
  );
  logic id_14;
  assign id_3 = id_6 ? 1 : -1'b0 ^ -1'b0 ? -1 : id_6;
  wire [-1 : id_6] id_15;
  assign id_11 = -1;
  assign id_8  = id_14 == 1'b0 ? id_0 : id_0;
endmodule

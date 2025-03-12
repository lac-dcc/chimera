// Seed: 556636448
module module_0 (
    input tri id_0,
    output uwire id_1,
    output wire id_2,
    output supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri id_8,
    input wor id_9,
    input wire module_0,
    output tri1 id_11
);
endmodule
module module_1 #(
    parameter id_8 = 32'd24,
    parameter id_9 = 32'd50
) (
    output tri1 id_0,
    input wand id_1,
    input tri id_2,
    output supply0 id_3,
    output wor id_4,
    input wor id_5,
    input tri1 id_6,
    output wor id_7,
    input wand _id_8,
    input wire _id_9,
    output wire id_10,
    input supply1 id_11,
    input tri0 id_12
);
  wire [1 'b0 : id_9] id_14;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_7,
      id_3,
      id_1,
      id_3,
      id_2,
      id_5,
      id_11,
      id_6,
      id_12,
      id_10
  );
  assign modCall_1.id_10 = 0;
  localparam id_15 = -1;
  localparam id_16 = 1;
  logic [-1 : 1 'b0] id_17;
  ;
  parameter id_18 = -1;
  logic id_19;
  assign id_3 = id_18[id_8 :-1] & id_15;
  wire [-1 : -1] id_20;
endmodule

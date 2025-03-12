// Seed: 674987292
module module_0 (
    input tri id_0,
    input wand id_1,
    input wire id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    input tri id_6,
    input uwire id_7,
    output wire id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wire id_11,
    input tri id_12,
    output tri0 id_13,
    output tri id_14,
    input uwire id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri id_18
);
  logic id_20;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd63
) (
    input tri id_0,
    input supply1 id_1,
    input uwire id_2,
    input wor id_3,
    output wand id_4,
    output supply0 id_5,
    input wor id_6,
    input tri _id_7,
    output wire id_8,
    input wire id_9
);
  assign id_4 = 1 == id_2;
  assign id_4 = ~id_1;
  logic [1 'b0 : id_7] id_11, id_12;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_6,
      id_1,
      id_3,
      id_0,
      id_4,
      id_0,
      id_2,
      id_9,
      id_9,
      id_8,
      id_8,
      id_9,
      id_2,
      id_8,
      id_3
  );
  assign modCall_1.id_4 = 0;
  logic id_13;
  logic [id_7 : 1] id_14;
  ;
  assign id_11[-1'd0] = id_0 + id_7 - "";
endmodule

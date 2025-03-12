// Seed: 711669986
module module_0 (
    output tri id_0,
    input wire id_1,
    output wor id_2,
    input wand id_3,
    input tri0 id_4,
    input supply0 id_5,
    output wand id_6,
    input wor id_7,
    input tri1 id_8,
    output tri id_9,
    input supply1 id_10
);
  parameter id_12 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd35
) (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2
    , _id_12,
    input supply1 id_3
    , id_13,
    output supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    input tri id_7,
    input wor id_8,
    input tri1 id_9,
    input tri id_10
);
  timeprecision 1ps;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_4,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7,
      id_1,
      id_4,
      id_0
  );
  assign modCall_1.id_3 = 0;
  logic [id_12 : $realtime] id_14;
  ;
endmodule

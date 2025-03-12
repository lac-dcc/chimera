// Seed: 387978709
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 id_5,
    output wor id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri1 id_9,
    input supply0 id_10
    , id_18,
    output wand module_0,
    output wor id_12,
    input supply1 id_13,
    output uwire id_14,
    output uwire id_15,
    input supply0 id_16
);
  wire id_19, id_20;
endmodule
module module_1 #(
    parameter id_0 = 32'd22,
    parameter id_7 = 32'd80
) (
    input tri0 _id_0,
    output wire id_1,
    input wire id_2,
    input wor id_3,
    input wand id_4,
    output wor id_5,
    input tri0 id_6,
    input tri0 _id_7,
    output wor id_8,
    output tri1 id_9,
    input wor id_10,
    input supply1 id_11
);
  parameter id_13 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_10,
      id_6,
      id_6,
      id_10,
      id_8,
      id_3,
      id_2,
      id_5,
      id_11,
      id_8,
      id_5,
      id_2,
      id_8,
      id_9,
      id_11
  );
  assign modCall_1.id_1 = 0;
  logic [id_0 : id_7] id_14;
  assign #({id_2 | id_4, id_7, -1, -1}) id_5 = id_2;
  assign id_8 = (-1 << 1'b0);
  logic id_15;
  ;
  parameter real id_16 = -1;
endmodule

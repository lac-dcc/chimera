// Seed: 2585491206
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output wire id_7,
    output wor id_8,
    input supply1 id_9
    , id_19,
    input wor id_10,
    output tri1 id_11
    , id_20,
    output tri1 id_12,
    output supply0 id_13,
    output wire id_14,
    output wand id_15,
    input tri1 id_16,
    input tri0 id_17
);
  wire id_21;
  id_22 :
  assert property (@(posedge id_3) id_20)
  else;
  final assume (id_1);
  parameter id_23 = -1'b0;
  wire id_24;
endmodule
module module_1 #(
    parameter id_1 = 32'd75
) (
    input  tri0  id_0,
    input  tri1  _id_1,
    output tri0  id_2,
    input  uwire id_3
);
  id_5(
      id_3
  );
  assign id_2 = 1;
  logic [id_1 : 1] id_6;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_3
  );
endmodule

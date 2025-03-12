// Seed: 4207637248
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply1 id_4,
    output wand id_5,
    output tri0 id_6,
    input wire id_7,
    output supply0 id_8,
    input uwire id_9,
    output uwire id_10,
    output wire id_11#(
        .id_15(-1),
        .id_16(-1'b0)
    ),
    input wand id_12,
    input tri0 id_13
);
  assign id_2 = id_1 && id_3;
  logic id_17;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd9,
    parameter id_4 = 32'd90
) (
    input uwire id_0,
    input tri1 _id_1,
    output supply1 id_2
);
  bit _id_4, id_5;
  assign id_2 = id_5 & id_4;
  final @(id_5) if (1) id_5 <= -1;
  logic id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_11 = 0;
  logic id_7 = 1'b0 == 1;
  wire [id_4 : {  id_1  {  id_4  }  }] id_8, id_9;
endmodule

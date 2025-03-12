// Seed: 22822865
module module_0 (
    input uwire id_0,
    input tri1  id_1
);
  logic [-1 'd0 : 1] id_3;
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd8
) (
    output wor   id_0,
    input  tri0  id_1,
    output wand  id_2,
    input  wire  id_3,
    input  uwire id_4,
    output wand  id_5,
    input  tri0  _id_6
);
  logic [id_6 : -1] id_8, id_9;
  module_0 modCall_1 (
      id_1,
      id_4
  );
  assign id_9 = id_3;
  xnor primCall (id_5, id_8, id_4, id_9, id_3, id_1);
  assign id_5 = -1;
endmodule
module module_2 #(
    parameter id_1 = 32'd36,
    parameter id_3 = 32'd75,
    parameter id_7 = 32'd29
) (
    output supply0 id_0,
    input wor _id_1,
    input tri0 id_2,
    input supply0 _id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri1 id_6,
    input wand _id_7,
    output wire id_8,
    input supply0 id_9
);
  final $signed(38);
  ;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_6,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_11;
  wire [id_3 : -1] id_12;
  logic [7:0] id_13;
  ;
  assign id_5 = id_12 + id_13[-1 : id_7] * -1 - id_11 && id_4;
  wire [id_1 : -1] id_14;
  parameter id_15 = 1'b0;
endmodule

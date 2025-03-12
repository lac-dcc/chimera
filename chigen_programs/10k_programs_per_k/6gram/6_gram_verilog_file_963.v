// Seed: 1344810392
module module_0 #(
    parameter id_8 = 32'd25
) (
    input  wand  id_0,
    output tri   id_1,
    output wand  id_2,
    input  wand  id_3,
    input  uwire id_4,
    output wand  id_5
);
  wire  id_7;
  logic _id_8;
  assign module_1.id_1 = 0;
  wire id_9;
  assign id_7 = id_0;
  logic id_10;
  ;
  wire id_11;
  assign id_5 = 1;
  wire ["" : id_8] id_12;
  initial assume ({-1'h0 < id_9{-1}});
endmodule
module module_1 #(
    parameter id_0 = 32'd67,
    parameter id_3 = 32'd12
) (
    input  tri0  _id_0,
    output wire  id_1,
    input  uwire id_2,
    output tri0  _id_3
);
  logic [1 : id_3] id_5;
  ;
  logic [id_0 : id_0] id_6;
  ;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule

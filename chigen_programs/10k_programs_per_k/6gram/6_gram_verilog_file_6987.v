// Seed: 2566349608
module module_0 (
    input  tri0 id_0,
    input  tri  id_1,
    input  tri0 id_2,
    input  tri1 id_3,
    input  wand id_4,
    input  wand id_5,
    input  tri0 id_6,
    input  wire id_7,
    output tri  id_8
);
  wire id_10;
  wire id_11;
  wire id_12;
  ;
  assign module_1._id_0 = 0;
  wire id_13;
  ;
  parameter id_14 = 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd55
) (
    output tri  _id_0,
    input  wand id_1,
    input  tri  id_2,
    input  wand id_3,
    output tri0 id_4
);
  logic id_6;
  ;
  assign id_6 = 1 - id_1;
  logic [id_0 : id_0] id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4
  );
  assign id_6 = 1;
  assign id_7 = id_1 ? id_6 : id_1;
endmodule

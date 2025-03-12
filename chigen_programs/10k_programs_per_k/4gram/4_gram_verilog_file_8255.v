// Seed: 2810294162
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire  \id_4 ;
  logic id_5;
  ;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd19,
    parameter id_3 = 32'd10
) (
    output tri   id_0,
    input  tri   id_1,
    input  wire  _id_2,
    input  tri0  _id_3,
    output logic id_4,
    output wand  id_5,
    output tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8,
    input  wire  id_9,
    output uwire id_10
);
  wire [id_2 : 1] id_12;
  wire [id_3  &&  1 : -1 'b0] id_13;
  assign id_13 = id_9;
  always force id_12.id_7 = -1;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_12,
      id_13,
      id_12
  );
  always @(-1 + id_12 or negedge 1'b0) id_4 <= 1;
  assign id_5 = ~id_13;
endmodule

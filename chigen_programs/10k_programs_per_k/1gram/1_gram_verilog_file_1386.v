// Seed: 1703869012
module module_0 #(
    parameter id_10 = 32'd24,
    parameter id_3  = 32'd95
) (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire _id_3, id_4;
  struct {
    logic id_5;
    logic id_6;
  } id_7;
  ;
  logic id_8[-1 : -1];
  parameter id_9 = 1;
  assign module_1.id_5 = 0;
  assign id_7 = 1;
  wire _id_10;
  assign id_10 = id_7.id_6;
  wire [id_3 : id_10] id_11;
  assign id_7.id_5 = id_4;
endmodule
module module_1 #(
    parameter id_9 = 32'd12
) (
    output logic id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  wire  id_5
);
  assign id_0 = id_4;
  parameter id_7 = -1'b0;
  always id_0 <= id_3;
  wand id_8 = id_1;
  nand primCall (id_0, id_7, id_3);
  assign id_8 = -1;
  logic [7:0][1  !==  -1  ==  1 : ~  -1] _id_9 = id_5, id_10 = id_3;
  assign id_10 = id_5;
  assign id_10[id_9] = -1;
  module_0 modCall_1 (
      id_7,
      id_8
  );
endmodule

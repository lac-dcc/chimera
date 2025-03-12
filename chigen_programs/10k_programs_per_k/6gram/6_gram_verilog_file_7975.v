// Seed: 1379733651
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  tri0 ["" : -1 'b0] id_3;
  parameter id_4 = 1;
  assign module_1.id_1 = 0;
  assign id_3 = -1'h0;
  wire id_5;
  assign id_3 = 1 ? -1 : 1;
endmodule
module module_1 #(
    parameter id_9 = 32'd1
) (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output logic id_3,
    input  uwire id_4,
    output logic id_5,
    input  wand  id_6,
    input  wire  id_7,
    input  wor   id_8,
    input  tri0  _id_9
);
  wire id_11;
  bit [id_9 : {  -1 'b0 ,  -1 'b0 }] id_12;
  assign id_12 = id_9;
  module_0 modCall_1 (
      id_11,
      id_11
  );
  initial begin : LABEL_0
    id_12 <= id_6;
    assert (-1'b0 || id_6);
    cover (id_2 || id_9 + 1 || 1);
    id_5 = id_12;
    id_3 <= -1 * 1;
    id_3 <= -1 ~^ id_8 + -1;
  end
endmodule

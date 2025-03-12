// Seed: 3938437415
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_7;
  logic id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd23
) (
    input  wire  id_0,
    input  tri1  id_1
    , _id_10,
    input  wand  id_2,
    input  tri   id_3,
    input  tri0  id_4,
    output wor   id_5,
    input  wire  id_6,
    input  tri0  id_7,
    output logic id_8
);
  wire [1 : id_10] id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
  always_latch @(posedge id_1 or posedge id_1 == -1'b0) begin : LABEL_0
    id_8 = -1 == id_3 - id_10;
  end
endmodule

// Seed: 1110042689
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  assign id_6 = id_8;
  wire id_11;
  wor  id_12 = -1, id_13;
  assign id_1 = id_12;
  parameter id_14 = "";
  logic id_15;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd31
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  output wire _id_7;
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_1,
      id_6,
      id_6,
      id_6,
      id_8
  );
  inout wire id_3;
  input wire id_2;
  output wor id_1;
  wire id_10;
  always @(posedge id_8) begin : LABEL_0
    assert (id_9);
  end
  assign id_1 = {1{-1'b0}} ? 1'b0 : id_5 ? id_5 : id_4;
  logic [id_7  ==  -1 'b0 : 1 'd0] id_11 = id_10;
  assign id_4[1] = -1;
endmodule

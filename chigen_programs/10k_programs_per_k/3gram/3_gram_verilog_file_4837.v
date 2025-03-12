// Seed: 267184288
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
  id_15 :
  assert property (@(negedge 1) -1 + -1 ** id_8)
  else assert (1);
  logic id_16;
  ;
  logic id_17;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd96
) (
    output logic id_0,
    input  tri1  _id_1
);
  logic [-1 : 1  -  id_1] id_3, id_4;
  for (id_5 = id_1; id_4; id_3 = id_4) begin : LABEL_0
    assign id_3 = id_5;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  initial begin : LABEL_1
    id_0 <= id_1;
  end
  assign id_4 = id_1;
  wire id_6;
endmodule

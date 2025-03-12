// Seed: 1120631109
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
    id_12
);
  inout logic [7:0] id_12;
  output logic [7:0] id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0]['b0 : 1] id_13;
  logic id_14 = id_13[-1==1'b0];
  assign id_11[(1)>(1)] = id_12 == id_8;
  wire id_15;
  ;
  always @(*) begin : LABEL_0
    if (1'b0) assume (id_12[-1]);
  end
endmodule
module module_1 #(
    parameter id_14 = 32'd73,
    parameter id_7  = 32'd48
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output logic [7:0] id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_4,
      id_10,
      id_4,
      id_11,
      id_9,
      id_10,
      id_8,
      id_12,
      id_3
  );
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire _id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wire [id_7 : 1] _id_14;
  always @(posedge id_3[-1 : 1] or posedge 1) begin : LABEL_0
    assert (id_7);
    id_12[id_14 :-1] = -1 == -1'b0;
  end
endmodule

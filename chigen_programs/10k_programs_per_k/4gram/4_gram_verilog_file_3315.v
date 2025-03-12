// Seed: 2864861586
module module_0;
  wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 ();
  input wire id_1;
  wire id_8;
  ;
endmodule
module module_2 ();
  final begin : LABEL_0
    assert (1);
  end
endmodule
module module_0 #(
    parameter id_12 = 32'd8,
    parameter id_13 = 32'd5,
    parameter id_6  = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    access,
    _id_12,
    _id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout wire _id_13;
  inout wire _id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  output logic [7:0] id_7;
  module_2 modCall_1 ();
  inout wire _id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_11 or negedge id_1 - 1) {(id_1), 1} = id_13;
  wire [-1 : -1] id_16;
  wire id_17;
  assign id_8[-1] = 1'b0;
  wire ["" : 1] id_18;
  assign id_7[1'h0] = -1;
  wire [-1 'h0 : id_13] id_19;
  wire [id_6 : id_12] module_3;
  wire id_20;
  assign id_8 = id_5;
endmodule

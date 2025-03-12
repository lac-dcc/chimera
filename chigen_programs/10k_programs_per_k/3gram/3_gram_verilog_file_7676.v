// Seed: 3130483192
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
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  tri [1 : -1] id_11;
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd32,
    parameter id_2 = 32'd61
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  inout reg id_4;
  output wire id_3;
  inout wire _id_2;
  input wire _id_1;
  assign id_4 = id_1;
  initial begin : LABEL_0
    id_4 <= id_2;
  end
  wire id_5;
  parameter id_6 = (-1);
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
      id_3
  );
  assign id_5 = id_6[id_2+1-:1] != id_4;
  always @(negedge -1 or posedge id_6[id_1]);
  wire [1 : 1 'h0] id_7;
  parameter id_8 = id_6;
  assign id_5 = 1;
  assign id_4 = id_5;
  wire id_9 = 1;
endmodule

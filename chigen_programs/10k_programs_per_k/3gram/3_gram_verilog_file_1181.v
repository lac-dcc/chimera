// Seed: 1231531574
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = id_5;
endmodule
module module_1 #(
    parameter id_4 = 32'd50,
    parameter id_7 = 32'd93
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout uwire id_10;
  output wire id_9;
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  output wire id_5;
  input wire _id_4;
  inout reg id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_10,
      id_2,
      id_10,
      id_10,
      id_10,
      id_10
  );
  inout reg id_1;
  always @(-1 or id_3) begin : LABEL_0
    #1 id_3 = -1;
  end
  always @(negedge id_6) id_1 = id_3;
  wire id_12;
  logic [id_4 : id_7] id_13;
  final begin : LABEL_1
    id_13 <= 1'h0;
  end
  assign id_10 = 1;
endmodule

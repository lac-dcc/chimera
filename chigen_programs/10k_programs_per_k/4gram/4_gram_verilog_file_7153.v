// Seed: 1701041140
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
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_7 = id_5;
endmodule
module module_1 #(
    parameter id_1 = 32'd3,
    parameter id_2 = 32'd19
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout reg id_3;
  inout wire _id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  parameter [-1 : -1] id_5 = 1;
  reg [-1 : id_1] id_6;
  for (id_7 = id_7; -1; id_6 = 1) always @(*) id_3 <= id_2;
  always @(posedge 1 || id_3) begin : LABEL_0
    id_3 <= 1'd0;
  end
  wire [id_1 : id_2] id_8;
  wire id_9 = id_4;
  wire id_10;
endmodule

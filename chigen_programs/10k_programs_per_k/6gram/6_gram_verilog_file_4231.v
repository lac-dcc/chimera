// Seed: 4039084328
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
  assign module_1.id_7 = 0;
  inout wire id_7;
  inout wire id_6;
  output reg id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout reg id_1;
  always @(posedge -1)
    if (1 & -1) id_1 = -1;
    else $signed(8);
  ;
  always @(posedge id_1) id_5 <= id_8;
  logic id_9;
  always @(posedge 1) begin : LABEL_0
    id_1 <= -1;
  end
endmodule
module module_1 #(
    parameter id_11 = 32'd83,
    parameter id_7  = 32'd0
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
    id_10
);
  input wire id_10;
  inout reg id_9;
  input logic [7:0] id_8;
  input wire _id_7;
  inout wire id_6;
  input wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_9 = !id_2 < (id_10 || 1);
  module_0 modCall_1 (
      id_9,
      id_6,
      id_10,
      id_1,
      id_9,
      id_6,
      id_6,
      id_6
  );
  assign id_4[id_7&-1] = $clog2(42);
  ;
  wire _id_11;
  always @(posedge id_8[id_11]) begin : LABEL_0
    if (1) id_9 <= 1 - id_1;
  end
endmodule

// Seed: 3745971995
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
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_13 = id_16;
  wire id_17;
  localparam id_18 = 1;
endmodule
module module_0 #(
    parameter id_8 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1,
    id_6,
    id_7,
    _id_8,
    id_9
);
  input wire id_9;
  input wire _id_8;
  inout wire id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_4,
      id_7,
      id_7,
      id_7,
      id_1,
      id_3,
      id_7,
      id_4,
      id_7,
      id_6,
      id_7,
      id_7,
      id_9
  );
  input wire id_3;
  output reg id_2;
  input wire id_1;
  always @(posedge id_3) begin : LABEL_0
    id_2 = -1;
  end
  wire id_10;
  assign id_5[id_8+:-1] = 1;
endmodule

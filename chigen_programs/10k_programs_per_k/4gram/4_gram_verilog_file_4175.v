// Seed: 949607556
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
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_2;
  wire id_9;
endmodule
module module_1 #(
    parameter id_14 = 32'd41,
    parameter id_18 = 32'd50
) (
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
    _id_14,
    id_15,
    id_16,
    id_17,
    _id_18
);
  inout wire _id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire _id_14;
  input wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_17,
      id_5,
      id_16,
      id_5,
      id_10,
      id_3,
      id_12,
      id_4
  );
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(1 or posedge id_4) begin : LABEL_0
    disable id_19;
  end
  logic [-1 'b0 : id_18  ^  id_14] id_20;
  integer id_21;
endmodule

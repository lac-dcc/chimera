// Seed: 1624186342
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  reg  id_5;
  wire id_6;
  always_latch @(posedge id_5 or posedge -1'b0) begin : LABEL_0
    id_5 <= -1'b0;
  end
endmodule
module module_0 #(
    parameter id_12 = 32'd58,
    parameter id_3  = 32'd95
) (
    id_1,
    id_2,
    module_1,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire _id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire _id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_9
  );
  input wire id_1;
  generate
    logic [id_3 : id_12] id_22;
  endgenerate
endmodule

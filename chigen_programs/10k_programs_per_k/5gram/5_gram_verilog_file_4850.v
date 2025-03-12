// Seed: 2407850842
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
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @("")
    if (1'b0 == 1) begin : LABEL_0
    end
  wire id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_9 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  output logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_1,
      id_7,
      id_4,
      id_6,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4
  );
  output wire id_2;
  output wire id_1;
  assign id_8[id_9] = ~id_7;
endmodule

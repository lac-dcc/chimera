// Seed: 4164622918
module module_0 #(
    parameter id_30 = 32'd94,
    parameter id_31 = 32'd30
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  output wire id_27;
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_28;
  assign id_25 = -1;
  wire id_29;
  assign module_1.id_1 = 0;
  defparam id_30.id_31 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_5;
  always @($realtime < 1 or posedge id_5[1]) begin : LABEL_0
    if (id_1) id_3 = (-1);
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule

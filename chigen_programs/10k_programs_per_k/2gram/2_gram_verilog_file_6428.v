// Seed: 3833368797
module module_0 (
    id_1,
    id_2,
    id_3#(
        .id_4(-1'b0),
        .id_5(id_6),
        .id_7(id_8),
        .id_9(id_10)
    ),
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
  output wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_22 = id_19;
endmodule
module module_1 #(
    parameter id_13 = 32'd82
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
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  output logic [7:0] id_16;
  output wire id_15;
  output wire id_14;
  input wire _id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_17,
      id_10,
      id_1,
      id_5,
      id_10,
      id_10,
      id_12,
      id_4,
      id_1,
      id_17,
      id_17,
      id_6,
      id_9,
      id_11,
      id_10,
      id_12,
      id_1,
      id_6,
      id_1,
      id_14
  );
  inout reg id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always_comb #1 begin : LABEL_0
    if (1) begin : LABEL_1
      id_16[id_13 :-1] <= id_1;
    end else id_8 = id_17;
  end
  logic id_18;
  ;
endmodule

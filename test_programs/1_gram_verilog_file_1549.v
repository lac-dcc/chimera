// Seed: 1203171039
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
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  if (id_18) assign id_15 = id_13;
  wire id_21;
  integer id_22;
endmodule
module module_1 (
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
    id_21
);
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_22;
  always @(-1 or negedge -1'b0) begin : LABEL_0
    @(negedge id_19) id_14 = id_19;
    #id_23 @(posedge id_13 or posedge id_15) id_4 = !id_1;
    id_20 <= ((-1));
  end
  always
    if (1) id_13 = 1;
    else id_15 = -1;
  parameter id_24 = id_4;
  module_0 modCall_1 (
      id_7,
      id_19,
      id_14,
      id_14,
      id_17,
      id_24,
      id_19,
      id_24,
      id_23,
      id_9,
      id_23,
      id_9,
      id_23,
      id_2,
      id_10,
      id_19,
      id_19,
      id_7,
      id_19,
      id_5
  );
  wire id_25, id_26;
  logic [7:0] id_27, id_28, id_29;
  wire id_30;
  wire id_31, id_32;
  wire id_33;
  always_latch @(~-1) id_29[-1 :-1] = id_27;
  wire id_34;
endmodule

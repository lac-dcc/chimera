// Seed: 3630259826
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
    id_15
);
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_18 = 32'd12,
    parameter id_4  = 32'd0,
    parameter id_6  = 32'd6
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13#(
        .id_14(id_15),
        .id_16((1'b0))
    ),
    id_17,
    _id_18,
    id_19,
    id_20,
    id_21
);
  input wire _id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout wor id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire _id_6;
  inout wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_10 = id_13;
  parameter id_22 = 1;
  wire [id_18 : id_4  **  id_6] id_23;
  assign id_9 = id_13++;
  always id_21 <= 1;
  id_24 :
  assert property (@(1) -1)
  else;
  module_0 modCall_1 (
      id_22,
      id_10,
      id_22,
      id_24,
      id_5,
      id_5,
      id_5,
      id_13,
      id_22,
      id_23,
      id_5,
      id_3,
      id_23,
      id_20,
      id_5
  );
  always begin : LABEL_0
    id_19 = $realtime;
  end
  assign id_19 = id_18;
endmodule

// Seed: 3735911704
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  \id_5 (
      .id_0(1'b0), .id_1(!id_1), .id_2(1), .id_3(1), .id_4(-1'h0)
  );
  wire id_6;
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
    id_20
);
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_21;
  id_22(
      .id_0(id_16 && ($realtime)),
      .id_1(id_4),
      .id_2($realtime),
      .id_3(id_3),
      .id_4(-1),
      .id_5(1),
      .id_6($realtime),
      .id_7(-1'b0),
      .id_8(),
      .id_9(),
      .id_10(1)
  );
  always @($realtime or negedge -1'b0) begin : LABEL_0
    id_1 <= id_21;
  end
  wire id_23;
  id_24(
      .id_0(1), .id_1(id_1), .id_2(1), .id_3(1'b0)
  );
  module_0 modCall_1 (
      id_20,
      id_4,
      id_14
  );
  assign id_4 = 1;
endmodule

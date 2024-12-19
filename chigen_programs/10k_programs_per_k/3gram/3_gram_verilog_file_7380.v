// Seed: 2443329328
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36
);
  input wire id_36;
  input wire id_35;
  output wire id_34;
  output wire id_33;
  output wire id_32;
  input wire id_31;
  output wire id_30;
  output wire id_29;
  output wire id_28;
  input wire id_27;
  inout wire id_26;
  output wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_28 = id_17;
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
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_21;
  assign id_20 = id_5;
  id_22(
      .id_0(""),
      .id_1(id_17),
      .id_2(1),
      .id_3(id_20),
      .id_4(id_20),
      .id_5(1),
      .id_6(id_5),
      .id_7(1),
      .id_8(1'b0 + 1),
      .id_9(id_4),
      .id_10(id_17),
      .id_11(1),
      .id_12(id_4),
      .id_13(id_9),
      .id_14(id_5),
      .id_15(id_20),
      .id_16(id_8 != id_5)
  );
  wire  id_23;
  uwire id_24;
  assign id_24 = 1;
  id_25 :
  assert property (@(posedge 0) 1'o0)
  else cover (1);
  logic [7:0] id_26, id_27;
  for (id_28 = 1'b0; id_4; id_25 = 1'b0) begin : LABEL_0
    assign id_26[1] = 1'h0;
  end
  module_0 modCall_1 (
      id_3,
      id_23,
      id_17,
      id_4,
      id_5,
      id_24,
      id_18,
      id_21,
      id_5,
      id_9,
      id_18,
      id_24,
      id_20,
      id_20,
      id_20,
      id_18,
      id_7,
      id_4,
      id_20,
      id_13,
      id_4,
      id_7,
      id_21,
      id_23,
      id_20,
      id_16,
      id_18,
      id_6,
      id_7,
      id_2,
      id_17,
      id_28,
      id_20,
      id_25,
      id_10,
      id_19
  );
endmodule

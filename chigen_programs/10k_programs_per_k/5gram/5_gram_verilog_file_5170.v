// Seed: 4217131014
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
    id_21
);
  input wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_22;
  id_23(
      .id_0(id_3), .id_1(id_20 | id_1 | id_8)
  );
  supply1 id_24 = 1 + 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_19(id_7),
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
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8 = id_18++;
  assign id_11[1] = 1 * !id_9;
  id_20(
      .id_0(1 != (id_1)),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_1),
      .id_6(1),
      .id_7(id_3),
      .id_8(id_7),
      .id_9(1),
      .id_10(id_14)
  ); id_21 :
  assert property (@(posedge 1) id_1 ==? 1 - 1'h0)
  else $display(id_10);
  always_ff @(id_16 or posedge 1) id_12 <= id_18 | 1;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_7,
      id_8,
      id_3,
      id_3,
      id_15,
      id_13,
      id_15,
      id_17,
      id_15,
      id_13,
      id_9,
      id_14,
      id_1,
      id_7,
      id_21,
      id_7,
      id_10,
      id_10,
      id_3
  );
endmodule

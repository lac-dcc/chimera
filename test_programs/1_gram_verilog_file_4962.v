// Seed: 2805346525
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6, id_7, id_8;
  wand id_9;
  id_10(
      .id_0(1),
      .id_1(id_3),
      .id_2(id_2),
      .id_3(1'h0 << 1),
      .id_4(-1),
      .id_5(id_3),
      .id_6(id_7),
      .id_7(-1)
  );
  assign id_8 = id_3;
  wire id_11;
  assign id_8 = id_9;
  id_12 :
  assert property (@(posedge id_5) -1 == id_8);
  wire id_13;
  wire id_14;
  assign id_2 = id_11;
  always_comb id_9 = id_8;
  wire id_15;
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
    id_13#(-1, 1),
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
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always if (-1) id_10 <= -1'b0;
  wire id_22;
  module_0 modCall_1 (
      id_20,
      id_17,
      id_20,
      id_8,
      id_9
  );
  assign modCall_1.type_16 = 0;
  wire id_23;
  assign id_9 = id_9;
  wire id_24, id_25, id_26, id_27;
endmodule

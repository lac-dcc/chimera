// Seed: 2586146964
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
  output wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_22(
      .id_0(id_11), .id_1()
  );
  wire id_23;
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
    id_10
);
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_11 :
  assert property (1'b0 |-> id_4);
  assign id_8 = id_5;
  id_12(
      .id_0(id_9),
      .id_1(id_5),
      .id_2(($realtime)),
      .id_3(id_3),
      .id_4($realtime),
      .id_5($realtime),
      .id_6(-1'b0)
  );
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_10,
      id_5,
      id_4,
      id_8,
      id_10,
      id_1,
      id_1,
      id_10,
      id_5,
      id_7,
      id_11,
      id_1,
      id_11,
      id_8,
      id_8,
      id_11,
      id_2
  );
endmodule

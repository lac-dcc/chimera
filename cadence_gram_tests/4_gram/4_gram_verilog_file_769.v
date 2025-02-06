// Seed: 825362758
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_7(
      .id_0(1), .id_1(1), .id_2(1'b0)
  ); id_8(
      .id_0(id_2), .id_1($realtime), .id_2(id_9), .id_3()
  ); id_10(
      id_9[$realtime], 1
  );
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
  output wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_22;
  always @(posedge $realtime) if (id_6) id_17 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_10,
      id_2,
      id_15,
      id_2
  );
  id_23(
      1'b0, $realtime
  );
  xnor primCall (id_2, id_21, id_5, id_14, id_10, id_22, id_18, id_6, id_3, id_4, id_19, id_15);
endmodule

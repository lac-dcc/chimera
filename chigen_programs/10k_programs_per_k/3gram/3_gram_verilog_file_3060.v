// Seed: 296114241
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
    id_14
);
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15;
  id_16(
      .id_0(1'b0), .id_1("")
  ); id_17(
      .id_0(1),
      .id_1(id_5),
      .id_2(id_14),
      .id_3(id_12),
      .id_4(1),
      .id_5(),
      .id_6(id_15),
      .id_7(id_8[1'b0==1]),
      .id_8(1'd0),
      .id_9(id_13)
  ); id_18 :
  assert property (@({id_4, 1 * 1}) id_1)
  else begin : LABEL_0
    #1;
    id_12 = id_13;
  end
  assign id_15 = id_10;
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
  output wire id_1;
  wire id_5;
  tri1 id_6 = id_2;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_2,
      id_6,
      id_4,
      id_2,
      id_3,
      id_1,
      id_6,
      id_4,
      id_5,
      id_7,
      id_1
  );
  wire id_8;
  assign id_6 = 1;
  id_9(
      .id_0(), .id_1(), .id_2(id_6), .id_3(1), .id_4(1'b0)
  );
  wire id_10;
  assign id_3[1 : 1] = id_2;
endmodule

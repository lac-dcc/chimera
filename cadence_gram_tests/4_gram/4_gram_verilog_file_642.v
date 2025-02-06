// Seed: 1593642027
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
    id_16
);
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  supply0 id_18 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_2,
      id_5,
      id_2,
      id_1,
      id_2,
      id_4,
      id_5
  );
  tri0 id_7;
  id_8(
      .id_0(id_6[(-1) : $realtime]),
      .id_1(id_3),
      .id_2(id_2),
      .id_3(-1'b0),
      .id_4(-1),
      .id_5(id_6),
      .id_6(id_1),
      .id_7(1),
      .id_8(id_2),
      .id_9(id_3),
      .id_10(),
      .id_11(-1)
  ); id_9(
      $realtime, id_4
  ); specify
    $width(posedge id_10, id_10, !id_7, id_11);
  endspecify
endmodule

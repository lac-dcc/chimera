// Seed: 3736362235
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
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_16(
      -1'b0, (-1), id_5, (id_1)
  ); id_17(
      .id_0(1),
      .id_1(id_12),
      .id_2(id_6),
      .id_3($realtime),
      .id_4(id_11),
      .id_5($realtime),
      .id_6(id_3)
  ); specify
    (negedge id_18 => (id_19  : 1'h0)) = (id_1  : 1'b0 : $realtime, id_5  : $realtime : 1);
    $width(negedge id_20 &&& (id_14 == id_1), id_5);
  endspecify
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri1 id_3
    , id_5
);
  wire id_6;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_6,
      id_5,
      id_8,
      id_6,
      id_8,
      id_5
  );
endmodule

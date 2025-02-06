// Seed: 3407131242
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
    id_29
);
  input wire id_29;
  input wire id_28;
  inout wire id_27;
  inout wire id_26;
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri id_30 = id_25;
  id_31(
      .id_0(-1),
      .id_1($realtime == $realtime),
      .id_2(id_20),
      .id_3(1'b0),
      .id_4(-1),
      .id_5($realtime),
      .id_6(-1),
      .id_7(-1'b0),
      .id_8(id_25),
      .id_9(id_14),
      .id_10(1),
      .id_11(id_17)
  );
  wire id_32;
  wire id_33, id_34, id_35, id_36;
  specify
    (negedge id_37 => (id_38  : 1)) = (id_30  : id_21 | $realtime : id_14,
                                       $realtime : $realtime : 1);
    (id_39 - => id_40) = (id_40  : -1  : id_19, id_26  : id_19  : $realtime);
  endspecify
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    output tri1  id_2,
    input  wire  id_3,
    input  uwire id_4
);
  wand id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6,
      id_7,
      id_7,
      id_8,
      id_7,
      id_9,
      id_6,
      id_6,
      id_7,
      id_8,
      id_7,
      id_8,
      id_9,
      id_9,
      id_6,
      id_8,
      id_8,
      id_7,
      id_6,
      id_7,
      id_9,
      id_7,
      id_7,
      id_9
  );
  wire id_10;
  assign id_6 = 1;
  id_11(
      .id_0(id_1 - id_7), .id_1(1)
  );
  wire id_12;
  wire id_13;
endmodule

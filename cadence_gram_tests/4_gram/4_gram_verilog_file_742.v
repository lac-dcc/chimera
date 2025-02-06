// Seed: 3674602781
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
  inout wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wand id_30 = 1 ? id_20 : -1 ? id_26 : $realtime ? 1 : 1;
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
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  specify
    (posedge id_10 => (id_11 -: id_7)) = (id_2 == $realtime : id_7  : 1, 1  : 1  : -1);
    $width(negedge id_12, $realtime, id_5[1], id_13);
  endspecify
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_3,
      id_12,
      id_4,
      id_7,
      id_11,
      id_11,
      id_9,
      id_10,
      id_1,
      id_2,
      id_8,
      id_4,
      id_7,
      id_7,
      id_9,
      id_7,
      id_4,
      id_6,
      id_10,
      id_1,
      id_11,
      id_12,
      id_3,
      id_7,
      id_12,
      id_1
  );
endmodule

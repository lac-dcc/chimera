// Seed: 1130097859
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
    id_35
);
  input wire id_35;
  inout wire id_34;
  input wire id_33;
  output wire id_32;
  inout wire id_31;
  input wire id_30;
  output wire id_29;
  output wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
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
    id_15
);
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wand id_9;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_5,
      id_9,
      id_4,
      id_7,
      id_4,
      id_9,
      id_13,
      id_9,
      id_7,
      id_7,
      id_13,
      id_4,
      id_15,
      id_5,
      id_11,
      id_15,
      id_7,
      id_9,
      id_5,
      id_7,
      id_2,
      id_14,
      id_9,
      id_9,
      id_5,
      id_5,
      id_4,
      id_9,
      id_10,
      id_3,
      id_7,
      id_5
  );
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_9 = 1;
  wire [1 : -1] id_16;
  assign id_1[1 : ~-1] = id_1;
  id_17 :
  assert property (@(posedge id_9) id_9)
  else;
  assign id_8 = 1;
  xnor primCall (id_2, id_5, id_1, id_7, id_15, id_4, id_9, id_13, id_14, id_3, id_12);
endmodule

// Seed: 1984313621
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
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  assign id_13 = 1;
  assign id_8  = 1;
  tri id_17 = -1'b0;
  always id_2 <= id_12;
  assign id_11 = 1 - id_4;
  assign module_1.id_22 = 0;
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
    id_17
);
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_18;
  id_19 :
  assert property (@* -1)
  else $display(id_6);
  reg id_20, id_21, id_22;
  module_0 modCall_1 (
      id_9,
      id_20,
      id_10,
      id_4,
      id_9,
      id_12,
      id_4,
      id_12,
      id_18,
      id_12,
      id_9,
      id_21,
      id_11,
      id_5,
      id_4
  );
  assign id_8[1] = id_20;
  wire id_23;
  assign id_17 = 1;
  supply1 id_24;
  tri id_25, id_26, id_27;
  assign id_24 = id_11;
  id_28 :
  assert property (@(posedge id_25 - id_11, id_2) 1) id_21 <= id_14;
  assign id_12 = id_12;
endmodule

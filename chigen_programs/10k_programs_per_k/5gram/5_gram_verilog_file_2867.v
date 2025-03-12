// Seed: 520135052
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
    id_27
);
  input wire id_27;
  output wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  inout wire id_20;
  inout tri id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_28;
  assign id_19 = 1;
  wire id_29;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    input wire id_4,
    input supply1 id_5,
    output wor id_6,
    input wire id_7,
    input uwire id_8,
    output wand id_9,
    input wire id_10,
    input wire id_11,
    input uwire id_12,
    input tri1 id_13,
    output wire id_14,
    input supply1 id_15,
    input tri1 id_16
);
  logic id_18;
  ;
  module_0 modCall_1 (
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18
  );
  id_19 :
  assert property (@(posedge id_8 == id_3 - -1) id_0 ==? 1'b0)
  else $clog2(32);
  ;
  and primCall (id_1, id_2, id_4, id_13, id_12, id_8, id_11, id_16, id_18, id_0, id_3, id_10);
endmodule

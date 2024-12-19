// Seed: 3425938848
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
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_22 :
  assert property (@(posedge id_2) 1)
  else $display(1);
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    input wor id_6,
    output wire id_7
);
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9,
      id_10,
      id_9,
      id_10,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9,
      id_10,
      id_10
  );
  assign id_7 = "" - id_4;
  nor primCall (id_3, id_5, id_0, id_2, id_10, id_9, id_4);
endmodule

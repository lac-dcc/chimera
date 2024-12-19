// Seed: 1236003493
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    input tri id_2,
    output wand id_3,
    output tri id_4,
    output tri0 id_5,
    output tri1 id_6,
    input wor id_7,
    output wor id_8,
    input wand id_9,
    output supply1 id_10,
    input supply1 id_11,
    input wire id_12,
    output wor id_13,
    input supply1 id_14,
    input wand id_15,
    output wire id_16,
    input uwire id_17,
    input logic id_18,
    input tri id_19,
    output tri0 id_20,
    input tri id_21,
    output wire id_22,
    input tri id_23,
    output wire id_24
);
  reg id_26;
  and primCall (
      id_3,
      id_18,
      id_14,
      id_17,
      id_28,
      id_23,
      id_11,
      id_27,
      id_7,
      id_2,
      id_15,
      id_26,
      id_12,
      id_9,
      id_21,
      id_0,
      id_19
  );
  reg id_27;
  always @(posedge 1 - id_23 or posedge 1)
    if (id_7) #id_28 force id_22 = id_26;
    else id_27 <= id_18;
  module_0 modCall_1 (
      id_28,
      id_28,
      id_28,
      id_28,
      id_28,
      id_28,
      id_28
  );
endmodule

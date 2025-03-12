// Seed: 571659889
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  assign module_1.id_17 = 0;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = id_2;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    output tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    input wand id_7,
    output tri id_8,
    input wand id_9,
    input uwire id_10,
    input wor id_11,
    input supply0 id_12,
    output wor id_13,
    output supply0 id_14,
    input supply0 id_15,
    input tri0 id_16,
    output wire id_17,
    output uwire id_18,
    input uwire id_19,
    input uwire id_20,
    input supply1 id_21,
    input tri1 id_22,
    input supply0 id_23,
    input tri0 id_24
);
  assign id_6 = id_10;
  wire [-1 'd0 : 1] id_26;
  wire [1 : 1] id_27;
  reg id_28;
  assign id_13 = id_3;
  nand primCall (
      id_6,
      id_11,
      id_9,
      id_0,
      id_10,
      id_12,
      id_3,
      id_19,
      id_15,
      id_20,
      id_23,
      id_7,
      id_26,
      id_1,
      id_16,
      id_22,
      id_27,
      id_21,
      id_2,
      id_24,
      id_28
  );
  assign id_13 = id_3;
  always @(negedge id_0#(1) or posedge 1'h0) id_28 <= 1;
  assign id_28 = id_1;
  module_0 modCall_1 (
      id_27,
      id_26,
      id_26,
      id_26,
      id_26
  );
  assign id_5 = -1;
  parameter id_29 = 1;
endmodule

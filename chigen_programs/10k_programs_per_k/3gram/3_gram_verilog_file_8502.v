// Seed: 1478178772
module module_0 (
    output wor id_0,
    output wire id_1,
    input uwire id_2,
    output wire id_3,
    input tri1 id_4,
    output supply1 id_5,
    output wor id_6,
    input wor id_7
);
  assign id_6 = 1;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply1 id_5
);
  assign id_0 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  tri  id_11 = 1;
  wire id_12;
  wire id_13;
  wire id_14;
  assign module_3.id_23 = 0;
endmodule
module module_3 (
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
    id_28
);
  output wire id_28;
  inout wire id_27;
  input wire id_26;
  inout wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_23 = id_16 | id_11;
  always @(1 - id_17 or posedge id_16) id_22 <= 1;
  tri1 id_29 = {id_5, 1'd0};
  module_2 modCall_1 (
      id_8,
      id_5,
      id_27,
      id_21,
      id_15,
      id_24,
      id_15,
      id_18,
      id_23
  );
  wire id_30;
endmodule

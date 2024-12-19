// Seed: 3922837031
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    output wand id_5,
    input tri0 id_6
);
  assign id_0 = id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    output wire id_4,
    input supply0 id_5,
    output uwire id_6,
    output tri id_7
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_7,
      id_6,
      id_4,
      id_5
  );
  assign modCall_1.type_13 = 0;
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
    id_31
);
  inout wire id_31;
  output wire id_30;
  input wire id_29;
  inout wire id_28;
  output wire id_27;
  input wire id_26;
  input wire id_25;
  input wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_21 = 1;
  wire id_32 = id_7;
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
    id_28,
    id_29,
    id_30
);
  inout wire id_30;
  input wire id_29;
  output wire id_28;
  inout wire id_27;
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_31;
  reg  id_32 = 1 | 1;
  reg  id_33 = {1'b0{1}};
  module_2 modCall_1 (
      id_4,
      id_23,
      id_13,
      id_16,
      id_9,
      id_11,
      id_25,
      id_27,
      id_27,
      id_12,
      id_17,
      id_9,
      id_26,
      id_1,
      id_19,
      id_25,
      id_16,
      id_19,
      id_27,
      id_9,
      id_9,
      id_16,
      id_26,
      id_15,
      id_31,
      id_11,
      id_27,
      id_11,
      id_3,
      id_27,
      id_25
  );
  always @(id_16 or id_25) id_33 <= id_32;
endmodule

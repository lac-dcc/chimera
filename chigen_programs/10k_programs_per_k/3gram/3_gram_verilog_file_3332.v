// Seed: 2869126605
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
    id_24
);
  output wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  supply1 id_25 = id_25;
  supply1 id_26;
  tri id_27 = {id_26, 1 | id_25};
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
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_16;
  assign id_1 = 1;
  assign id_16[1] = id_15;
  assign id_10[1|1] = 1;
  wire id_17, id_18;
  xor primCall (
      id_13,
      id_16,
      id_17,
      id_15,
      id_3,
      id_18,
      id_7,
      id_10,
      id_12,
      id_8,
      id_9,
      id_14,
      id_2,
      id_19,
      id_6
  );
  id_19(
      1, id_9
  );
  assign id_3 = id_19;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_9,
      id_18,
      id_6,
      id_4,
      id_12,
      id_2,
      id_2,
      id_2,
      id_18,
      id_14,
      id_6,
      id_12,
      id_11,
      id_17,
      id_17,
      id_12,
      id_17,
      id_15,
      id_17,
      id_7,
      id_13
  );
  assign id_2 = 1;
endmodule

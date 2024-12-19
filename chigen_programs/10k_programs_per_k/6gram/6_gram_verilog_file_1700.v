// Seed: 2532843702
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
  output wire id_23;
  output wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_25;
  specify
    (id_26 => id_27) = (1  : id_4 & 1'b0 : id_21, id_13  : 1  : id_1);
    (id_28 => id_29) = (id_13  : 1  : ~id_1, id_3);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_2,
      id_1,
      id_5,
      id_4,
      id_5,
      id_3,
      id_2,
      id_5,
      id_1,
      id_4,
      id_5,
      id_2,
      id_4,
      id_1,
      id_1,
      id_5,
      id_4,
      id_3,
      id_4
  );
  assign id_2 = id_5;
  assign id_5 = id_1;
endmodule

// Seed: 2907160360
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  task id_12;
    logic id_13;
  endtask
  assign id_1 = id_10;
  wire id_14;
  wire id_15;
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd21
) (
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
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire _id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_5,
      id_12,
      id_8,
      id_7,
      id_9,
      id_20,
      id_20,
      id_16
  );
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  or primCall (id_16, id_9, id_8, id_7, id_20, id_14, id_12, id_13, id_11, id_1);
  wire id_21;
  static logic [1 : id_15] id_22;
endmodule

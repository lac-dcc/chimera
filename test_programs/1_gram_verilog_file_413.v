// Seed: 2314864462
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1'b0;
  id_13(
      1, id_8, -1'h0
  );
  wire id_14;
  wire id_15;
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_13,
      id_7,
      id_12,
      id_13,
      id_7,
      id_13,
      id_11,
      id_9,
      id_12,
      id_11
  );
  nor primCall (id_11, id_10, id_5, id_7, id_2, id_13, id_8, id_3, id_12);
endmodule

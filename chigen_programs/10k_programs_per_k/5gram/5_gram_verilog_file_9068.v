// Seed: 2375878399
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  wire id_15;
  wire id_16;
  wor  id_17;
  wire id_18, id_19;
  assign id_17 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_4,
      id_4,
      id_6,
      id_6,
      id_8,
      id_1,
      id_1,
      id_8,
      id_6,
      id_8
  );
  assign id_7[1'b0==1] = 1;
  wire id_9;
  tri  id_10;
  assign id_10 = id_5 ? 1 - (id_2) : 1'h0;
endmodule

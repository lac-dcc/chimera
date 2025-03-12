// Seed: 1740506300
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output tri1 id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_16;
  assign id_8 = 1;
  wire id_17;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_1,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_4,
      id_1,
      id_4
  );
  assign id_2[1-:(1)] = id_5;
endmodule

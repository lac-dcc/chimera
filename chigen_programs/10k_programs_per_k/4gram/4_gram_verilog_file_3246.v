// Seed: 3889324989
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always_latch @(negedge id_7) assign id_2 = id_6;
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
  inout logic [7:0] id_14;
  inout wire id_13;
  output wire id_12;
  output logic [7:0] id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_13,
      id_4,
      id_9,
      id_10,
      id_1,
      id_8
  );
  output wire id_5;
  and primCall (id_4, id_8, id_15, id_13, id_14, id_6, id_1, id_10, id_9);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_14[-1]   = (id_10);
  assign id_11[1+:1] = -1;
endmodule

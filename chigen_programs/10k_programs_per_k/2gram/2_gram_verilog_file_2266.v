// Seed: 4163898185
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(1)),
    id_8,
    id_9
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
  assign id_5 = id_9;
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial @(id_9[1] or 1'd0);
  id_22 :
  assert property (@(posedge id_15) id_1)
  else;
  wire id_23;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_15,
      id_12,
      id_2,
      id_21,
      id_3,
      id_1,
      id_14,
      id_2
  );
  assign id_20 = id_9;
endmodule

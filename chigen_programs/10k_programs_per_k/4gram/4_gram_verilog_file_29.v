// Seed: 4072327805
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always_ff @(posedge 1) id_1 = id_4++;
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
    id_14
);
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  wire id_16;
  module_0 modCall_1 (
      id_16,
      id_9,
      id_15,
      id_3,
      id_10
  );
  assign modCall_1.id_4 = 0;
  wire id_17;
  id_18 :
  assert property (@(posedge 1 | id_18) 1)
  else $display;
endmodule

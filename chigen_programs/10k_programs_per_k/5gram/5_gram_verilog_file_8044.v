// Seed: 1618454789
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_14;
  wire id_15;
  assign id_3 = 1;
  wire id_16;
  assign id_3 = id_4;
  wire id_17;
  id_18(
      1'd0, id_3
  ); id_19 :
  assert property (@(posedge id_14) 1 ? id_14 : 1)
  else $display(~id_13, 1);
  always @(negedge id_16) id_11 = id_4;
  wire id_20 = id_7, id_21;
  tri0 id_22 = 1;
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
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_7,
      id_1,
      id_7,
      id_2,
      id_3,
      id_6,
      id_1,
      id_5,
      id_7
  );
  id_8(
      1, 1
  );
endmodule

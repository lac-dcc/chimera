// Seed: 353881444
`timescale 1 ps / 1ps `default_nettype id_14
primitive id_4(id_1, id_14, id_13);
  reg id_14;
  input id_15, id_16, id_17;
  table
    1 0 ? : 0;
    0 0 : 0;
    1 ? : 1;
    0 1 : 0;
    ? ? ? 1 0 0 : 0;
    1 0 ? ? ? 1 : 0;
    ? 1 0 0 x 1 : 1;
    ? 0 0 0 x 0 : 1;
    ? 0 1 : 0;
  endtable
endprimitive
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
  output id_14;
  inout id_13;
  inout id_12;
  output id_11;
  inout id_10;
  output id_9;
  input id_8;
  output id_7;
  inout id_6;
  input id_5;
  inout id_4;
  inout id_3;
  input id_2;
  inout id_1;
  assign id_13 = 1;
endmodule

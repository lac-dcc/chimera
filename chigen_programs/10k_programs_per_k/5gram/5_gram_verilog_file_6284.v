// Seed: 2283033993
`timescale 1 ps / 1ps
`define pp_26 0
module module_0 (
    input id_0,
    input logic id_1,
    input logic id_2,
    output logic id_3,
    output id_4,
    input id_5,
    input logic id_6,
    input id_7,
    output id_8,
    output logic id_9,
    input logic id_10,
    input logic id_11,
    input id_12,
    input id_13,
    output id_14,
    output id_15,
    output logic id_16
    , id_26,
    input id_17,
    input id_18,
    input id_19,
    output id_20,
    output logic id_21,
    output id_22,
    output id_23,
    input id_24,
    output logic id_25
);
  logic id_27 = 1;
  type_41 id_28 (
      .id_0(1),
      .id_1(1'h0),
      .id_2(id_17)
  );
  type_42 id_29 (
      id_26,
      1
  );
  type_1 id_30 (
      .id_0(1),
      .id_1(1),
      .id_2({id_27 | id_27{id_13}} + 1),
      .id_3(1'b0),
      .id_4(id_10)
  );
  always #1 begin
    @(1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout id_8;
  output id_7;
  input id_6;
  input id_5;
  output id_4;
  inout id_3;
  input id_2;
  output id_1;
  assign id_16 = id_13;
  logic id_26;
endmodule

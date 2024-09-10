// Seed: 2450435520
`default_nettype id_1 `timescale 1ps / 1 ps
module module_0 #(
    parameter id_12 = 32'd73
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
    id_11
);
  output id_11;
  input id_10;
  input id_9;
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic _id_12;
  reg id_13, id_14, id_15, id_16, id_17;
  reg   id_18;
  reg   id_19;
  logic id_20;
  logic id_21;
  assign id_6 = id_5;
  type_2 id_22 (
      {1, id_1, 1, (id_14) & 1 !== 1},
      id_17,
      1,
      id_11
  );
  assign id_18 = id_16;
  always @(posedge (id_22)) begin
    id_1 <= id_19;
    for (id_1 = id_1; id_4[id_12 : 1]; id_8 = id_15) id_13 <= id_15;
  end
  logic id_23;
  logic id_24;
  reg id_25 = id_19, id_26;
  initial begin
    id_17 = 1 ? id_2 : id_25;
  end
endmodule

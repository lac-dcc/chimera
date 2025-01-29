// Seed: 4253650418
module module_0;
  reg id_2, id_3 = id_3, id_4, id_5, id_6;
  bit id_7, id_8;
  reg id_9;
  reg id_10 = -1;
  assign id_9 = id_6;
  wire id_11 = -1;
  for (id_12 = id_4 & id_9; id_10; id_4 = id_12) begin : LABEL_0
    assign id_7 = id_10;
    always_latch @(posedge id_4)
    fork
      if (id_12 << 1 | 1 == id_9) id_1 <= id_10;
      id_4 <= 1;
    join
  end
  genvar id_13;
  assign id_12 = -1;
  wire id_14;
  assign id_6 = id_2;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(.id_9(id_10)),
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  wire id_16;
  wire id_17, id_18, id_19;
  module_0 modCall_1 ();
  assign modCall_1.id_7 = 0;
endmodule

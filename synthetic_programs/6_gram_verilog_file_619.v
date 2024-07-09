`timescale 1ps / 1ps `resetall
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    input logic id_5,
    output logic [id_2  |  1 : (  id_4  )] id_6,
    id_7
);
  assign id_5 = 1;
  input id_8;
  id_9 id_10 (
      .id_5(1),
      .id_7(1'b0)
  );
  logic id_11;
  logic id_12 [id_5 : id_2];
  id_13 id_14 (
      .id_12(id_13),
      .id_11(id_12),
      .id_9 (id_8[id_3] == id_1),
      .id_4 (""),
      .id_6 (1)
  );
  id_15 id_16 (
      .id_12(id_8),
      .id_5 (id_8),
      .id_9 (id_3)
  );
  always @(posedge id_10 or posedge 1'd0) id_6[id_2[1]] <= 1;
  id_17 id_18 (
      id_5[1],
      .id_17(id_17 <= id_13#(.id_19(1))),
      .id_13(1)
  );
  assign id_15 = 1'b0;
  logic id_20;
  logic id_21 (
      .id_12(id_20[1]),
      .id_14(id_5),
      .id_5 (id_6),
      .id_3 (1'b0)
  );
  assign id_9 = id_7;
  id_22 id_23 (
      .id_18(id_22),
      .id_1 (id_3),
      .id_18(id_16),
      .id_19(id_2),
      .id_10(id_17),
      .id_21(1)
  );
endmodule
module module_24;
endmodule

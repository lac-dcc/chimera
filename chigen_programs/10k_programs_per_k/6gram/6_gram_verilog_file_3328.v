// Seed: 4261954622
`timescale 1 ps / 1 ps
module module_0 (
    input id_0,
    input logic id_1,
    input logic id_2,
    output logic id_3,
    output tri1 id_4,
    input wire id_5
);
  type_25 id_6 (
      .id_0((1'b0)),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1)
  );
  logic id_7, id_8;
  logic id_9, id_10, id_11;
  type_1 id_12 (
      .id_0(1),
      .id_1(1),
      .id_2(id_11),
      .id_3(id_1),
      .id_4(1),
      .id_5(1),
      .id_6(id_10),
      .id_7(id_5),
      .id_8(1 & id_5[1 : 1])
  );
  type_27 id_13 (
      .id_0(id_4[1]),
      .id_1(1),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_12),
      .id_5(1),
      .id_6(!id_2),
      .id_7(1),
      .id_8(1),
      .id_9(1'b0)
  );
  logic id_14;
  logic id_15;
  logic id_16;
  type_2 id_17 (
      .id_0((1)),
      .id_1(id_13),
      .id_2(1)
  );
  assign id_11 = 1;
  logic id_18;
  specify
    $width(negedge id_19, id_11);
  endspecify
endmodule

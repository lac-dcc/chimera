// Seed: 763397257
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_1;
  tri0 id_5 = 1;
  id_6(
      .id_0(), .id_1(1'b0), .id_2(1), .id_3(), .id_4(1), .id_5(id_5)
  ); id_7(
      .id_0(id_3),
      .id_1(1),
      .id_2(id_3),
      .id_3(id_1 + 1),
      .id_4(1),
      .id_5(id_3),
      .id_6(""),
      .id_7(id_1),
      .id_8(1),
      .id_9(id_5 && 1),
      .id_10(1'b0),
      .id_11((id_6)),
      .sum(id_5),
      .id_12(id_5),
      .id_13(id_6),
      .id_14(id_2),
      .id_15(1)
  );
  supply1 id_8 = id_5 - 1;
endmodule
program module_1 (
    input  wor   id_0,
    input  wire  id_1,
    output logic id_2,
    output logic id_3
);
  timeunit 1ps;
  always @(1 or 1) id_3 <= 1;
  reg   id_5 = id_0 | 1;
  logic id_6;
  reg   id_7;
  logic id_8, id_9;
  supply0 id_10 = 1 == "";
  always_comb @(posedge 1 or posedge id_1) begin : LABEL_0
    if (id_8) begin : LABEL_0
      id_6 = id_9;
    end
    id_5 <= id_8;
  end
  always @* id_7 <= id_8;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11
  );
  assign id_2 = id_6;
endprogram

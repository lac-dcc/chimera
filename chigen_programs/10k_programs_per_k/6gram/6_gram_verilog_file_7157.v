// Seed: 1797270029
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
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1'b0;
  assign id_6[1] = !1'h0;
  generate
    if (id_8 && 1'b0) assign id_14[1] = id_7;
    else id_15(.id_0((1)), .id_1(1'h0));
  endgenerate
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1,
    input tri0  id_2,
    input wor   id_3
);
  assign id_5 = id_3 + id_3;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_6
  );
  id_7(
      .id_0(id_6[1]),
      .id_1(1),
      .id_2(id_6),
      .id_3(1 & id_1),
      .id_4(id_3),
      .id_5(1),
      .id_6(1),
      .id_7(),
      .id_8(id_3),
      .id_9(1),
      .id_10(id_1),
      .id_11(1),
      .id_12(id_5),
      .id_13((id_3 & 1 && (id_3 - (id_2 != 1 && id_5 ? id_5 : id_0 - 1'b0)))),
      .id_14()
  );
endmodule

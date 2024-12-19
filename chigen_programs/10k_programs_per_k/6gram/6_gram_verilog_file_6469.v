// Seed: 446924140
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input supply0 id_6
);
  nmos (1, id_0, id_0);
  assign module_1.type_1 = 0;
  id_8(
      .id_0(id_6 & 1), .id_1(1), .id_2(id_1), .id_3((1))
  );
  supply1 id_9;
  id_10(
      .id_0(1'h0 & id_2),
      .id_1(1),
      .id_2(""),
      .id_3(1'b0),
      .id_4(1),
      .id_5(1),
      .id_6(id_1 == id_2),
      .id_7(id_6),
      .id_8(1'h0),
      .id_9(id_1),
      .id_10(id_3 == 1),
      .id_11(1),
      .id_12(id_6),
      .id_13(id_8),
      .id_14(1),
      .id_15((id_8)),
      .id_16(id_1),
      .id_17(1'h0),
      .id_18((id_4)),
      .id_19(id_4 * 1 - id_2)
  );
  wire id_11;
  assign id_0 = id_9;
  wire id_12;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input tri id_2,
    input tri id_3,
    output wor id_4,
    input wire id_5,
    output wor id_6,
    input wand id_7,
    output supply0 id_8,
    output tri1 id_9,
    output tri0 id_10,
    input wor id_11,
    input supply1 id_12,
    input wire id_13,
    input logic id_14,
    input wand id_15,
    input wor id_16,
    output wor id_17
);
  always @(*) begin : LABEL_0
    assign id_6 = id_14;
  end
  and primCall (id_4, id_13, id_3, id_5, id_7, id_15, id_11, id_14, id_2, id_12, id_16);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_2,
      id_2,
      id_13,
      id_13
  );
endmodule

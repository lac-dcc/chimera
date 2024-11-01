// Seed: 1842248137
module module_0 (
    input wor id_0,
    input wire id_1,
    input supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    input supply0 id_7,
    output wor id_8,
    output tri0 id_9,
    input tri1 id_10,
    output tri0 id_11,
    output wire id_12,
    input supply0 id_13,
    output tri1 id_14,
    input wand id_15,
    input supply1 id_16,
    input tri id_17,
    input uwire id_18,
    input tri0 id_19,
    output wand id_20
);
  assign id_12 = 1;
  assign id_20 = 1;
  initial begin
    assign id_11 = ~id_4;
  end
  generate
    assign id_9 = id_19 ? id_4 * id_2 : 1;
  endgenerate
  wire  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wand id_4,
    output uwire id_5,
    input wand id_6,
    input uwire id_7
    , id_9
);
  always @(posedge id_9 or posedge id_7);
  id_10(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_6),
      .id_4(1),
      .id_5(id_9),
      .id_6(1),
      .id_7(id_1),
      .id_8(id_2),
      .id_9(id_2),
      .id_10(1'b0),
      .id_11(id_2),
      .id_12(1),
      .id_13(id_2),
      .id_14(id_5),
      .id_15(1),
      .id_16(id_4),
      .id_17(1),
      .id_18(1 ^ id_1 ^ id_9),
      .id_19(1),
      .id_20(id_5),
      .id_21((1 || id_3)),
      .id_22(1'b0),
      .id_23(1),
      .id_24(1),
      .id_25(1'b0),
      .id_26(id_7)
  ); module_0(
      id_6,
      id_0,
      id_7,
      id_9,
      id_9,
      id_5,
      id_6,
      id_9,
      id_1,
      id_1,
      id_7,
      id_2,
      id_2,
      id_0,
      id_9,
      id_3,
      id_7,
      id_3,
      id_3,
      id_6,
      id_5
  );
  assign id_4 = id_6 ? 1 : id_7;
  uwire id_11 = 1;
  wire  id_12;
endmodule

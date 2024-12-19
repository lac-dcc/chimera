// Seed: 2667827948
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    output tri1  id_2,
    output tri0  id_3
    , id_15,
    output uwire id_4,
    output wire  id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  wire  id_8,
    output tri   id_9,
    input  tri0  id_10,
    input  wand  id_11,
    output tri0  id_12,
    output uwire id_13
);
  wire id_16;
  wire id_17;
  id_18(
      .id_0(id_13),
      .id_1(1 != id_9),
      .id_2(id_1),
      .id_3(id_16),
      .id_4(id_7 && id_0),
      .id_5(1),
      .id_6(id_16),
      .id_7(id_2 < 1),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(id_16 - id_1),
      .id_12((1)),
      .id_13((id_4#(.id_14(1)))),
      .id_15(id_10),
      .id_16((1'h0) - id_15),
      .id_17(1),
      .id_18(1)
  );
  assign module_1.id_11 = 0;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    output logic id_2,
    input logic id_3,
    input tri0 id_4,
    input logic id_5,
    input wire id_6,
    input tri0 id_7,
    output supply1 id_8,
    output tri1 id_9,
    input logic id_10,
    output tri0 id_11,
    input tri1 id_12,
    output wor id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_11,
      id_13,
      id_9,
      id_0,
      id_7,
      id_4,
      id_1,
      id_9,
      id_1,
      id_7,
      id_8,
      id_8
  );
  always @(id_5 or posedge id_6 ? id_10 : id_3) id_2 <= id_10;
  xnor primCall (id_8, id_6, id_15, id_1, id_5, id_7, id_10, id_3, id_4);
endmodule

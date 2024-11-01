// Seed: 156183537
module module_0 (
    output wand id_0,
    output wand id_1,
    output uwire id_2,
    input tri id_3,
    input tri0 id_4,
    output wire id_5,
    input wor id_6,
    output wor id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wand id_10,
    output wand id_11,
    output supply0 id_12,
    input tri1 id_13,
    output wire id_14,
    input wor id_15
    , id_21,
    output wire id_16,
    output tri0 id_17,
    input tri1 id_18
    , id_22,
    output tri0 id_19
);
  supply1 id_23 = 1'b0;
  wire id_24;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri id_5,
    input tri0 id_6,
    output wor id_7,
    input wire id_8,
    input wand id_9,
    output tri0 id_10,
    input wire id_11,
    output tri0 id_12,
    output tri1 id_13,
    input wire id_14,
    output wand id_15
);
  tri id_17;
  id_18(
      .id_0(1),
      .id_1(id_4),
      .id_2(1),
      .id_3(id_7 & 1),
      .id_4(1),
      .id_5(id_17),
      .id_6(1'h0),
      .id_7(1'b0),
      .id_8(1),
      .id_9(id_13),
      .id_10((1)),
      .id_11(id_13),
      .id_12(1),
      .id_13(1),
      .id_14(id_7),
      .id_15(""),
      .id_16(1),
      .id_17(1),
      .id_18(1'h0)
  );
  always @(posedge id_2) begin
    id_17 = 1'b0;
  end
  module_0(
      id_15,
      id_15,
      id_0,
      id_2,
      id_2,
      id_13,
      id_4,
      id_10,
      id_11,
      id_2,
      id_5,
      id_15,
      id_15,
      id_2,
      id_10,
      id_11,
      id_15,
      id_10,
      id_8,
      id_12
  );
endmodule

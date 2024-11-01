// Seed: 3976397646
module module_0 (
    output wor id_0,
    input supply1 id_1
    , id_16,
    output uwire id_2,
    input wor id_3
    , id_17,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri id_7,
    output wor id_8,
    output wor id_9,
    input uwire id_10,
    input wire id_11,
    input tri id_12
    , id_18,
    input wor id_13,
    input wand id_14
);
  id_19(
      .id_0(id_7), .id_1(1), .id_2(id_10), .id_3(id_3), .id_4(id_4), .id_5(1), .id_6(1 + 1'b0 & 1)
  );
  wire id_20;
  always @(id_6 or posedge 1) begin
    #1 id_8 += 1'b0;
    id_9 -= !id_12;
  end
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    input wand id_3,
    output tri0 id_4,
    output wor id_5,
    input supply1 id_6,
    input tri id_7,
    input supply1 id_8,
    output supply0 id_9,
    output wor id_10,
    output wire id_11
);
  wire id_13;
  wire id_14;
  module_0(
      id_5, id_8, id_5, id_7, id_8, id_8, id_6, id_8, id_4, id_10, id_0, id_3, id_2, id_3, id_0
  );
  integer id_15 (
      .id_0 (id_8),
      .id_1 (1),
      .id_2 (id_11),
      .id_3 (1),
      .id_4 (id_10),
      .id_5 (id_13),
      .id_6 (id_3),
      .id_7 (1),
      .id_8 (id_13),
      .id_9 (),
      .id_10(id_13),
      .id_11(id_9),
      .id_12(id_9),
      .id_13(1),
      .id_14(1'h0),
      .id_15(1'h0 ^ (id_4)),
      .id_16('h0)
  );
endmodule

// Seed: 3053984209
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output wand id_2,
    input tri id_3,
    output supply1 id_4,
    output wand id_5,
    output wand id_6,
    input tri0 id_7
);
  always_latch @(id_7) begin
    disable id_9;
  end
  supply0 id_10;
  assign id_5  = 1;
  assign id_10 = 1;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input uwire id_2,
    input tri id_3,
    output tri id_4,
    output uwire id_5,
    input supply1 id_6
);
  id_8(
      .id_0(1'h0),
      .id_1(1),
      .id_2(1),
      .id_3(1'd0),
      .id_4((1'b0)),
      .id_5(1),
      .id_6(id_4),
      .id_7(id_5),
      .id_8(id_2),
      .id_9(1'b0),
      .id_10(1'b0),
      .id_11(id_6),
      .id_12(id_2)
  );
  nor (id_5, id_2, id_3, id_1, id_8);
  module_0(
      id_2, id_6, id_5, id_1, id_0, id_4, id_5, id_6
  );
  assign id_5 = id_1;
endmodule

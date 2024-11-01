// Seed: 4186165663
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wand id_4,
    output tri id_5,
    output wand id_6
);
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(id_3),
      .id_1(id_10 ? 1 : 1),
      .id_2(id_8),
      .id_3(id_12),
      .id_4((id_5)),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_2),
      .id_8(id_11),
      .id_9(id_10),
      .id_10(id_3),
      .id_11(id_4),
      .id_12(id_5),
      .id_13(1),
      .id_14(1),
      .id_15(id_1)
  );
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    output logic id_5
);
  always @(*) begin
    assume #1  (1) $display(1);
    else $display(1);
    id_5 <= 1;
    id_5 <= 1;
    id_0 = id_3;
  end
  xor (id_5, id_1, id_2);
  module_0(
      id_2, id_0, id_2, id_1, id_2, id_0, id_0
  );
endmodule

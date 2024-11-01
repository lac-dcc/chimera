// Seed: 3368768073
module module_0 (
    input uwire id_0,
    output tri id_1,
    output tri1 id_2,
    output wand id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wand id_6,
    input uwire id_7,
    input wand id_8,
    output tri1 id_9,
    output tri0 id_10,
    output supply1 id_11
);
  assign id_11 = id_7;
  id_13(
      .id_0(id_8),
      .id_1(id_4#(.id_2(~(1 < 1)))),
      .id_3(id_3),
      .id_4(id_9),
      .id_5(1),
      .id_6((id_11)),
      .id_7(1),
      .id_8(id_10)
  );
  assign id_11 = id_8;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri0  id_1,
    output wand  id_2,
    output logic id_3,
    output wire  id_4
);
  always @(id_0) begin
    id_2 = id_0;
    if ({'d0, 1}) id_2 = id_0;
    else id_3 <= 1;
  end
  uwire id_6 = id_1;
  assign id_2 = 1'b0;
  module_0(
      id_1, id_6, id_2, id_6, id_0, id_2, id_4, id_6, id_1, id_6, id_6, id_2
  );
  wire id_7;
endmodule

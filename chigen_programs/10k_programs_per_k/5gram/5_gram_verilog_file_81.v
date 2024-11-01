// Seed: 2117888727
module module_0 (
    output tri0 id_0,
    input  wor  id_1,
    output wire id_2,
    input  wand id_3
);
  id_5(
      .id_0(), .id_1(id_2), .id_2(1)
  ); id_7(
      1'b0, 1, 1
  );
  final begin
    #1;
  end
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    output tri id_2,
    output wand id_3,
    input uwire id_4,
    input wand id_5,
    output uwire id_6,
    input tri id_7,
    input tri1 id_8
);
  wire id_10;
  module_0(
      id_6, id_5, id_1, id_8
  );
  final begin
    disable id_11;
  end
  nand (id_1, id_4, id_5, id_10, id_7);
endmodule

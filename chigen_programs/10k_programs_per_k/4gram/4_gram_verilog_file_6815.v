// Seed: 499499406
module module_0 (
    output wand id_0,
    input tri id_1,
    output tri1 id_2,
    output supply1 id_3,
    output wand id_4
);
  assign module_1.id_4 = 0;
  initial begin : LABEL_0
    disable id_6;
  end
  wire id_7;
  assign id_0 = id_1;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output wire  id_3,
    output wire  id_4,
    input  tri1  id_5,
    input  wand  id_6,
    input  tri1  id_7,
    output tri   id_8
);
  assign id_4 = id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_8,
      id_3
  );
  wire id_10, id_11, id_12, id_13;
  id_14(
      .id_0(id_6), .id_1(1), .id_2(id_8)
  );
endmodule

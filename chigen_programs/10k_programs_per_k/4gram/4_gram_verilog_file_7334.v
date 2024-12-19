// Seed: 2601212564
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output wand id_2,
    output wor id_3,
    output tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wand id_9
);
  assign id_4 = id_6;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output tri1  id_3,
    output wor   id_4,
    input  tri0  id_5,
    input  uwire id_6,
    input  uwire id_7,
    output wire  id_8
);
  assign id_3 = id_1;
  initial begin : LABEL_0
    id_0 = id_6;
  end
  id_10(
      .id_0(""), .id_1(1), .id_2(1'b0), .id_3(1), .id_4(1)
  );
  wire id_11, id_12;
  int id_13 = 1;
  assign id_4 = 1'b0 ? 1 : 1 ? id_7 : id_13;
  id_14(
      .id_0(1), .id_1(1), .id_2(1), .id_3(~id_7), .id_4(1), .id_5(1'b0)
  );
  module_0 modCall_1 (
      id_7,
      id_3,
      id_4,
      id_8,
      id_4,
      id_8,
      id_5,
      id_13,
      id_5,
      id_2
  );
endmodule

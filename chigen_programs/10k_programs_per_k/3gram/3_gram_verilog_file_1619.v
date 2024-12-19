// Seed: 190355940
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    output wand id_2,
    output tri id_3,
    input wand id_4,
    input tri1 id_5
);
  uwire id_7;
  wire  id_8;
  assign id_7 = 1;
  id_9(
      .id_0(1'b0), .id_1(id_5), .id_2(1'b0), .id_3(id_5)
  );
  wire id_10;
endmodule
macromodule module_1 (
    output tri id_0,
    input supply0 id_1,
    input supply1 id_2,
    inout wire id_3,
    output tri1 id_4,
    input uwire id_5
);
  wire id_7;
  wand id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_5,
      id_3
  );
  assign modCall_1.id_1 = 0;
  always @(posedge id_3) id_9 = id_12;
endmodule

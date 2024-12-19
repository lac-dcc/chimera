// Seed: 3424239373
module module_0 (
    output tri0 id_0,
    output wand id_1,
    output wire id_2,
    output uwire id_3,
    input uwire id_4,
    output supply0 id_5,
    output wire id_6,
    input wor id_7,
    output wand id_8,
    input uwire id_9
);
  assign id_0 = 1;
  initial $display(1 ^ 'h0 <-> 1);
  id_11(
      .id_0(id_9), .id_1()
  );
endmodule
module module_1 (
    input  wor   id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  wand  id_5
);
  assign id_4 = id_0;
  assign id_4 = 1'b0;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_1,
      id_5,
      id_1,
      id_1,
      id_0,
      id_1,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule

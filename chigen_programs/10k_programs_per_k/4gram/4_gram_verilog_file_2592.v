// Seed: 1209773265
module module_0 (
    input wand id_0,
    output wor id_1,
    input supply1 id_2,
    output uwire id_3,
    input wor id_4,
    input wire id_5
);
  initial begin : LABEL_0
    id_3 = 1'b0;
    #1;
  end
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    output supply0 id_2,
    output wand id_3
);
  assign id_3 = 1 ? id_1 : id_1;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  uwire id_5 = 1;
  tri0  id_6 = id_5 * !id_1 - 1;
endmodule

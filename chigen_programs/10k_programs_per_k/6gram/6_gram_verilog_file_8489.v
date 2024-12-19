// Seed: 3869782743
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    input wire id_3,
    output tri id_4,
    input wand id_5
);
  assign id_4 = 1'd0;
  wire id_7;
  id_8(
      .id_0(id_0 !== (id_5)), .id_1()
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input wire id_2,
    output supply1 id_3,
    output wand id_4
);
  tri  id_6;
  wire id_7;
  tri0 id_8 = 1;
  always begin : LABEL_0
    id_3 = id_6;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_3,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule

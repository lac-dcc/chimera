// Seed: 2989952588
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input wor id_4,
    output wire id_5,
    output tri0 id_6
);
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    input tri0 id_7,
    input uwire id_8,
    output supply1 id_9,
    output supply0 id_10,
    output uwire id_11
);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_11,
      id_6,
      id_11,
      id_11
  );
  assign modCall_1.id_0 = 0;
  always #1 begin : LABEL_0
    fork : SymbolIdentifier
      id_13(1 == -1, -1 % 1, -1, id_3, 1, 1'b0, 1, 1 == -1);
      id_14;
    join
  end
  assign id_9 = 1;
endmodule

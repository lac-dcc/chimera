// Seed: 1582665587
module module_0 (
    input uwire id_0,
    input wand  id_1
);
  assign module_2.type_11 = 0;
  assign module_1.id_11   = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output tri0 id_4,
    output uwire id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    input supply0 id_9,
    inout supply1 id_10,
    output wor id_11
);
  assign id_11 = id_9;
  module_0 modCall_1 (
      id_10,
      id_10
  );
endmodule
module module_2 (
    input wor id_0,
    output tri0 id_1
    , id_8,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wand id_6
);
  always_latch begin : LABEL_0
    id_8[1'b0] = id_4 !== (1'b0);
  end
  module_0 modCall_1 (
      id_2,
      id_5
  );
endmodule

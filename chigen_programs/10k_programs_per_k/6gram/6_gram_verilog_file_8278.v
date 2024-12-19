// Seed: 1613101159
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input wor id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri id_5,
    output wor id_6,
    output tri0 id_7
);
  uwire id_9 = 1;
  wire  id_10;
endmodule
module module_1 (
    input  wire  id_0,
    output uwire id_1,
    output wand  id_2,
    input  tri   id_3,
    input  wor   id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    output tri0 id_0
    , id_7,
    input wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    input tri0 id_4,
    output tri1 id_5
);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_0,
      id_2,
      id_2,
      id_5,
      id_0
  );
  always @(1 or posedge 1) begin : LABEL_0
    assert (1);
  end
endmodule

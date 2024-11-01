// Seed: 2023400424
module module_0 (
    output wand  id_0,
    input  wand  id_1,
    input  uwire id_2,
    output tri   id_3,
    input  tri0  id_4,
    output wire  id_5,
    input  wor   id_6,
    output wor   id_7
);
endmodule
module module_1 (
    output uwire id_0,
    output tri   id_1,
    input  tri1  id_2,
    input  wand  id_3
);
  wire id_5;
  module_0(
      id_0, id_3, id_2, id_0, id_3, id_1, id_2, id_0
  );
endmodule
module module_2 (
    output wor   id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  wor   id_3,
    output wand  id_4,
    output wand  id_5
);
  reg   id_7;
  uwire id_8;
  wor   id_9;
  initial begin
    assert (id_8 + 1);
    id_7 <= (1 == id_9);
  end
  module_0(
      id_0, id_1, id_1, id_0, id_3, id_5, id_3, id_0
  );
endmodule

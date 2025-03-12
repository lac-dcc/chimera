// Seed: 3773004592
module module_0 (
    input  tri0  id_0,
    input  tri1  id_1,
    output tri   id_2,
    input  uwire id_3,
    output tri   id_4,
    input  uwire id_5,
    output wire  id_6
);
  supply1 id_8;
  logic   id_9;
  logic   id_10 = id_0;
  assign id_8 = id_8 ? -1'b0 : id_8;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    output wor id_2,
    input wor id_3,
    output supply0 id_4
);
  wire  id_6;
  logic id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule

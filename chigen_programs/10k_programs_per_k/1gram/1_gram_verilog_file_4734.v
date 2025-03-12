// Seed: 757915609
module module_0 (
    input  tri   id_0,
    output wand  id_1,
    output wire  id_2,
    input  uwire id_3,
    input  uwire id_4,
    output tri1  id_5,
    output wor   id_6,
    input  tri0  id_7
);
  struct packed {logic id_9;} id_10;
endmodule
module module_1 #(
    parameter id_4 = 32'd2
) (
    output tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri _id_4,
    input wand id_5,
    input tri id_6,
    input supply1 id_7
);
  wire [id_4 : 1  +  -1] id_9;
  assign id_9 = ~id_6;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_5,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule

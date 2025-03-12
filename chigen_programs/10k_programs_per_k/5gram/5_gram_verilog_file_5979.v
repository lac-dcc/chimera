// Seed: 481170785
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    output tri1 id_7,
    input supply0 id_8,
    output wand id_9,
    output tri0 id_10,
    output supply1 id_11
    , id_14,
    input wire id_12
);
  wire id_15;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    output uwire id_4,
    input  wor   id_5
);
  assign id_0 = {1{id_5 && id_2}};
  not primCall (id_0, id_5);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_4,
      id_2,
      id_0,
      id_4,
      id_0,
      id_1
  );
  assign modCall_1.id_12 = 0;
  assign id_0 = 1;
  wire id_7;
endmodule

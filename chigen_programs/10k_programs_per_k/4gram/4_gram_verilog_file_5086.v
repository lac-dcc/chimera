// Seed: 4242385041
module module_0 (
    input supply1 id_0,
    input tri1 id_1
    , id_7,
    input uwire id_2,
    input wand id_3,
    input tri0 id_4,
    output uwire id_5
);
  wire id_8;
  specify
    if (id_2) (id_9 => id_10) = 1;
    if (-1) (negedge id_11 => (id_12 +: {id_3{id_7 ^ 1'b0}})) = (1 * id_2, 1);
    specparam id_13 = 1;
  endspecify
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wire  id_1
    , id_6,
    input  uwire id_2,
    input  wor   id_3,
    input  uwire id_4
);
  wire id_7, id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_3,
      id_1
  );
endmodule

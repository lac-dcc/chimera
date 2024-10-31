// Seed: 3299643016
module module_0 (
    output tri0  id_0,
    input  uwire id_1,
    output tri1  id_2,
    output uwire id_3
);
  specify
    (id_5 => id_6) = 0;
    (id_7 => id_8) = (1  : 1  : id_7, id_6);
    (id_9 => id_10) = 0;
    (id_11 => id_12) = (id_11  : 1'b0 : id_5, id_9 < id_9);
  endspecify
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  wand  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wor   id_6,
    output tri1  id_7
);
  wor id_9 = 1;
  module_0(
      id_0, id_1, id_0, id_0
  );
endmodule

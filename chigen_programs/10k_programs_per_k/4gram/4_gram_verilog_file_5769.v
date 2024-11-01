// Seed: 2351313510
module module_0 (
    input tri1  id_0,
    input tri1  id_1,
    input uwire id_2
);
  specify
    (id_4 *> id_5) = 1;
    (id_6 => id_7) = 1;
  endspecify
endmodule
module module_1 (
    input tri0 id_0
    , id_10,
    input supply1 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri1 id_5,
    output supply1 id_6,
    input uwire id_7,
    output tri1 id_8
);
  supply0 id_11;
  assign id_11 = 1;
  xnor (id_6, id_0, id_11, id_4, id_10, id_3, id_7, id_5, id_2);
  module_0(
      id_0, id_2, id_1
  );
endmodule

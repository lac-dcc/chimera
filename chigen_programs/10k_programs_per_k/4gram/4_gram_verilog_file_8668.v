// Seed: 3643759509
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input tri id_2,
    input tri id_3,
    input wire id_4,
    input uwire id_5,
    input supply0 id_6,
    input tri0 id_7,
    input supply1 id_8
    , id_21,
    input wire id_9,
    input wand id_10,
    input tri id_11,
    input supply1 id_12,
    output wire id_13,
    input tri0 id_14,
    input supply1 id_15,
    input wor id_16,
    output tri0 id_17,
    input tri0 id_18,
    input supply1 id_19
);
  nmos (1, id_2);
  wire id_22;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  wor   id_2,
    output tri   id_3,
    output wand  id_4
);
  specify
    (id_6 => id_7) = (id_1  : 1  : 1, 1'b0 : id_2  : 1);
    (id_8, id_9 => id_10) = (1 == id_7  : 1  : id_8, 1);
    (id_11 => id_12) = (1, (id_2));
  endspecify
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_8,
      id_6,
      id_11,
      id_2,
      id_7,
      id_11,
      id_8,
      id_12,
      id_1,
      id_1,
      id_7,
      id_10,
      id_2,
      id_6,
      id_8,
      id_8,
      id_10
  );
endmodule

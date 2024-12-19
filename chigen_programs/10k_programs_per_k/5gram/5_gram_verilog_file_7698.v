// Seed: 2133598747
module module_0 (
    output wor   id_0,
    output uwire id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  wor   id_4,
    output uwire id_5
    , id_7
);
  assign id_1 = id_3 ^ id_4 == 1'b0 ? id_4 : id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output tri id_0,
    output tri1 id_1,
    input wire id_2,
    output supply1 id_3,
    output wire id_4
    , id_15,
    input uwire id_5,
    input wire id_6,
    output tri0 id_7,
    input wor id_8,
    input supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input wor id_12,
    input tri1 id_13
);
  assign id_1 = 1;
  or primCall (id_4, id_2, id_5, id_9, id_13, id_12, id_8, id_6, id_15);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_13,
      id_9,
      id_4
  );
endmodule

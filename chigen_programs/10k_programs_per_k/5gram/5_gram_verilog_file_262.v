// Seed: 2707837068
module module_0 (
    input wire id_0,
    output tri1 module_0,
    output wire id_2,
    output tri id_3,
    input supply1 id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri id_9
);
  tri1 id_11;
  assign id_2 = id_11 - id_11++;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input wire id_2,
    output wire id_3,
    input supply0 id_4,
    output tri0 id_5,
    input wire id_6,
    output tri id_7,
    output uwire id_8,
    output tri0 id_9
    , id_13,
    input wand id_10,
    input tri id_11
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_4,
      id_10,
      id_10,
      id_10,
      id_6
  );
  assign modCall_1.type_15 = 0;
  wire id_14;
  timeunit 1ps;
  xnor primCall (id_8, id_6, id_11, id_1, id_2, id_10, id_0, id_4, id_13);
  assign id_8 = id_4 ? id_11 : -1;
endmodule

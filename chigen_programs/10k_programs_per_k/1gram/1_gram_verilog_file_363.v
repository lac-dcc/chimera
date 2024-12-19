// Seed: 3626346364
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output tri1 void id_2,
    input uwire id_3,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    output tri1 id_7,
    output tri1 id_8,
    output uwire id_9,
    input tri0 id_10,
    input tri id_11
    , id_19,
    input tri id_12,
    output supply0 id_13,
    input wor id_14,
    output tri0 id_15,
    input supply1 id_16,
    input supply0 id_17
);
  wire id_20;
  assign id_13 = id_0;
endmodule
macromodule module_1 (
    input wand id_0,
    input supply1 id_1,
    input wire id_2,
    output uwire id_3,
    input tri0 id_4
);
  assign id_3 = 1;
  tri0 id_6, id_7;
  supply1 id_8;
  always
  fork
    begin : LABEL_0
      if (id_1) @(1) $display(1, id_4, id_6, id_8);
    end
  join_none
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_7,
      id_4,
      id_6,
      id_7,
      id_3,
      id_3,
      id_0,
      id_8,
      id_6,
      id_3,
      id_2,
      id_6,
      id_0,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule

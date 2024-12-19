// Seed: 3801136811
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri id_2,
    output supply1 id_3
);
  assign id_3 = id_0 - 1;
  assign id_3 = id_0 ? 1 : 1'b0;
  assign id_3 = 1'h0;
  wire id_5;
  int  id_6;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    output supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    output wand id_11
);
  specify
    if (id_10) (negedge id_13 *> (id_14 +: 1)) = (id_10, id_14);
    (id_15 => id_16) = (id_16, 1);
  endspecify
  xor primCall (id_5, id_10, id_3, id_1, id_0, id_4, id_14, id_13, id_16, id_9, id_6, id_7, id_15);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_5
  );
endmodule

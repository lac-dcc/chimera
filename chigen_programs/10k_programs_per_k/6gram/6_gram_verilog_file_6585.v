// Seed: 306163693
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  uwire id_3 = 1, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14;
  nor primCall (
      id_1, id_10, id_11, id_12, id_13, id_14, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9
  );
  module_2 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    output supply0 id_5,
    input tri id_6,
    output supply1 id_7
);
  integer id_9;
  module_0 modCall_1 (
      id_9,
      id_9
  );
  assign modCall_1.id_10 = 0;
endmodule
module module_2 ();
  initial begin : LABEL_0
    id_1 = 1;
    id_1 = #id_2('d0);
    id_1 <= id_2 != 1;
  end
endmodule

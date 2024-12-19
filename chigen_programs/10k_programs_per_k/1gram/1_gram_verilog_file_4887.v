// Seed: 1830557865
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wand id_6,
    input wand id_7,
    input wand id_8
);
  assign module_2.id_8 = 0;
endmodule
module module_1 (
    input tri0 id_0
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    output supply1 id_0,
    input  uwire   id_1,
    output supply0 id_2,
    input  supply0 id_3
);
  wire id_5;
  wire id_6;
  and primCall (id_0, id_5, id_6, id_1);
  supply1 id_7, id_8;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3
  );
  assign id_7 = 1;
endmodule

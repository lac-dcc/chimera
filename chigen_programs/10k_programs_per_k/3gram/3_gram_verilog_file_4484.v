// Seed: 3546820813
module module_0 (
    output uwire id_0,
    output wire id_1,
    input supply1 id_2,
    input tri id_3,
    input supply1 id_4,
    input supply1 id_5
);
  wire id_7;
  assign id_0 = 1;
  assign id_0 = {id_2{1}};
  wire id_8;
endmodule
macromodule module_1 (
    output uwire id_0,
    input wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input tri1 id_5
);
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule

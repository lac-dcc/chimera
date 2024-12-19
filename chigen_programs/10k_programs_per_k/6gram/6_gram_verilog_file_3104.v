// Seed: 3121113542
module module_0 (
    input  wire id_0,
    output wire id_1
);
  assign id_1 = id_0;
  assign module_2.type_7 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    input tri id_3,
    output wire module_1
);
  assign id_4 = id_0 ? id_3 : 1'h0;
  not primCall (id_4, id_1);
  module_0 modCall_1 (
      id_3,
      id_4
  );
endmodule
module module_2 (
    input  uwire id_0,
    output uwire id_1,
    input  tri1  id_2,
    output tri1  id_3
);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule

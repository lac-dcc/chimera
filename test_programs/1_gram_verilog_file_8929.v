// Seed: 3524455320
module module_0 (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    input wand id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6,
    output supply1 id_7
);
  assign id_7 = id_6;
  assign module_2.type_1 = 0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wand id_0,
    input  wor  id_1
);
  wire id_3;
  supply0 id_4 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  final $display;
  wand id_5 = id_4;
endmodule
module module_2 (
    inout  supply0 id_0,
    output supply1 id_1
);
  wire id_3, id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule

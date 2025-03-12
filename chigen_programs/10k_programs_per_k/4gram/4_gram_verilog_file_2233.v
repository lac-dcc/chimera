// Seed: 171329692
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri0 id_3,
    input wand id_4,
    input wire id_5
);
  logic id_7 = {id_7{id_7}};
  assign id_0 = -1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4,
    output supply1 id_5
);
  assign id_5 = id_2;
  xor primCall (id_5, id_7, id_4);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_5,
      id_3,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    input tri id_3,
    input supply1 id_4,
    output uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3
  );
endmodule

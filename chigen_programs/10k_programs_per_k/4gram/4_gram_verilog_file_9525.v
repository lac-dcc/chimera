// Seed: 3369003864
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output tri0 id_2,
    output uwire id_3,
    input wire id_4
);
  assign id_3 = id_1;
  wire id_6 = id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri1 id_1
);
  assign id_1 = 1;
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0
  );
endmodule
module module_2 (
    output wand id_0,
    input supply0 id_1,
    input uwire id_2,
    output wor id_3,
    input wire id_4,
    output supply0 id_5,
    input wand id_6,
    input wire id_7
);
  logic id_9;
  xor primCall (id_5, id_4, id_9, id_6, id_7, id_2, id_1);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule

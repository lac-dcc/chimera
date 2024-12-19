// Seed: 3978317404
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input uwire id_2,
    input wor id_3,
    input supply0 id_4,
    input uwire id_5,
    input supply0 id_6
);
  wire id_8;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    input supply0 id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign id_0 = 1;
endmodule
module module_2 (
    output tri0 id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wire id_4,
    inout wire id_5,
    input uwire id_6,
    output supply0 id_7,
    input supply1 id_8,
    output tri id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_2,
      id_8,
      id_2,
      id_8
  );
  assign modCall_1.type_9 = 0;
endmodule

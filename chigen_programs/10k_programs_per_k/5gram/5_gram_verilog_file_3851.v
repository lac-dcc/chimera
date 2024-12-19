// Seed: 3644513325
module module_0 (
    input wire id_0,
    output uwire id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output uwire id_8
);
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    input wand id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
  wire id_8;
endmodule
module module_2 (
    input tri1 id_0,
    output wor id_1,
    output supply1 id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
  wire id_5;
endmodule

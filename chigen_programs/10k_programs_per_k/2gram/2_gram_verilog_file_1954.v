// Seed: 3690235114
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    output wor id_3,
    output wire id_4,
    input tri1 id_5,
    output tri1 id_6,
    output tri id_7
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri id_2,
    input tri1 id_3,
    output tri1 id_4,
    input supply1 id_5,
    output wor id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_6,
      id_0,
      id_6,
      id_4
  );
  assign id_6 = -1'b0;
endmodule
module module_2 (
    input supply1 id_0,
    output uwire id_1,
    input wand id_2,
    output tri id_3
);
  timeprecision 1ps;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule

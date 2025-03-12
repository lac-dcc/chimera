// Seed: 1652050889
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input tri0 id_2
);
  parameter id_4 = -1;
  module_2 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
  logic id_5;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input wor id_2,
    output wor id_3,
    input wire id_4
);
  logic [-1 : -1] id_6;
  nor primCall (id_3, id_6, id_4);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2
  );
endmodule
module module_2 (
    output tri id_0,
    input tri id_1,
    input supply1 id_2,
    input wand id_3
);
  wire id_5;
endmodule

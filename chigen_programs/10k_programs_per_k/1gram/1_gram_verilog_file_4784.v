// Seed: 3513467444
module module_0 (
    input uwire id_0,
    output tri id_1,
    output tri1 id_2,
    input supply0 id_3,
    input tri id_4
);
  logic id_6;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output wor id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    input wand id_6
);
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_5
  );
  assign id_2 = 1 | id_5 & 1;
  assign id_2 = -1;
  assign id_2 = id_4;
  id_8 :
  assert property (@(*) 1 - -1) id_8 = "";
endmodule

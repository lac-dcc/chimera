// Seed: 1396333280
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3
);
  assign id_0 = -1;
  assign module_2.id_2 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output wand  id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1
  );
  wire id_5;
  parameter id_6 = id_1 & 1'b0;
  assign id_4 = id_5;
  always id_2 = id_1;
endmodule
module module_2 (
    input wand id_0,
    inout supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    output wire id_5,
    output tri id_6,
    input tri id_7
);
  supply1 id_9 = id_7;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_9
  );
  assign id_1 = -1;
endmodule

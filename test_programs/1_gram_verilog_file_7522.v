// Seed: 1375095263
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    output supply1 id_3,
    output tri0 id_4,
    output tri1 id_5,
    output wand id_6
);
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output tri id_4,
    output uwire id_5,
    output wand id_6,
    input uwire id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1,
      id_6,
      id_4,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_1 = 1;
  assign id_1 = id_4;
  assign id_3 = 1 ? !-1 : id_6;
endmodule
module module_3 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  always id_1.id_1 <= id_1;
  wire id_3;
  wire id_4;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule

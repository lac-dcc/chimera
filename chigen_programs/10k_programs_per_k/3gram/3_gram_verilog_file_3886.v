// Seed: 359272010
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0(
      id_4, id_2, id_7, id_3, id_4
  );
  wire id_8;
endmodule
module module_2 (
    input tri1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri id_3,
    output supply0 id_4
);
endmodule
module module_3 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    output tri0 id_3,
    input wand id_4,
    input tri id_5,
    output wand id_6
);
  wire id_8;
  or (id_6, id_0, id_4, id_1, id_8, id_5);
  module_2(
      id_1, id_5, id_5, id_2, id_6
  );
endmodule

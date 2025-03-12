// Seed: 1503870560
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wor id_5,
    input wor id_6,
    output uwire id_7,
    input wand id_8
);
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input wire id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_4,
      id_5,
      id_2
  );
endmodule
module module_0 (
    module_2,
    id_2
);
  output wand id_2;
  inout wire id_1;
  assign id_2 = {-1 + id_1, 1, id_1};
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  module_2 modCall_1 (
      id_1,
      id_6
  );
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule

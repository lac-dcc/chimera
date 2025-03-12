// Seed: 3974087696
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_5
  );
  logic id_6;
  ;
endmodule
module module_2 (
    input uwire id_0,
    input wor   id_1,
    input wor   id_2,
    input wor   id_3
);
  logic id_5;
  ;
endmodule
module module_3 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wand id_3,
    input wire id_4,
    input tri id_5,
    input supply0 id_6,
    output wor id_7,
    input tri0 id_8
);
  assign id_7 = -1'b0;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.id_2 = 0;
  always disable id_10;
endmodule

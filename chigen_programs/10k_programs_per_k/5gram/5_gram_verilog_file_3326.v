// Seed: 2310351535
module module_0 (
    input wor id_0,
    output uwire id_1,
    input wor id_2,
    input supply1 id_3,
    input tri1 id_4
);
  wire id_6;
  wire id_7;
  xnor primCall (id_1, id_6, id_7, id_4);
  module_2 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6
  );
  wire id_8;
  generate
    assign id_6 = 1;
  endgenerate
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    input supply0 id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  integer id_8;
endmodule

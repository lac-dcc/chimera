// Seed: 3542773298
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5
  );
endmodule
module module_2 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    input tri  id_3
);
  id_5(
      .id_0(id_3), .id_1(id_1 !=? id_1 - id_0), .id_2(1'b0)
  );
  wand id_6;
  assign id_6 = 1;
  wire id_7;
  assign module_3.type_0 = 0;
endmodule
module module_3 (
    input  uwire id_0,
    output uwire id_1,
    output wand  id_2,
    output tri0  id_3,
    input  wor   id_4,
    input  wor   id_5
);
  assign id_2 = id_4 & id_5;
  assign id_2 = 1'b0;
  assign id_2 = 1 ? 1 : 1'd0 == 1'b0;
  id_7(
      .id_0({1, 1'b0, id_5}), .id_1(id_0), .id_2(id_0)
  );
  module_2 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0
  );
endmodule

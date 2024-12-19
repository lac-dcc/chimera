// Seed: 1522020958
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  supply1 id_3;
  wire id_4;
  assign id_2 = (id_1);
  assign id_3 = id_1 ^ 1;
  assign module_2.type_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input wand id_0,
    input wire id_1
);
  integer id_3;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  id_4(
      .id_0(id_3 * id_3), .id_1(1'b0), .id_2(1'b0), .id_3(id_0), .id_4(1), .id_5()
  );
endmodule

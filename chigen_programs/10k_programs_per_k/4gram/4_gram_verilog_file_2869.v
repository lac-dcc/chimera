// Seed: 3319007300
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    input wor id_5,
    output tri1 id_6,
    output supply1 id_7,
    input wand id_8
);
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    output supply1 id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  supply0 id_3;
  wor id_4;
  assign id_3 = 1;
  logic [7:0] id_5;
  logic [7:0] id_6;
  supply1 id_7 = 1 ? 1 : 1;
  integer id_8;
  assign id_6 = !id_4;
  wire id_9, id_10, id_11;
endmodule
module module_3;
  wire id_1;
  wire id_2;
  wire id_3;
  module_2 modCall_1 (
      id_3,
      id_2
  );
  id_4(
      .id_0($display), .id_1(1), .id_2(1 / id_2), .id_3(1), .id_4(1), .id_5(id_3)
  );
endmodule

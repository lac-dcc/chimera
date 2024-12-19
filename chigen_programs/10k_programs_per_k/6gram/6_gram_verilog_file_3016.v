// Seed: 2469672897
module module_0 (
    input wand id_0,
    input wire id_1
);
  final $display(id_1, id_0 == {1 - 1, 1'b0});
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output supply1 id_2
);
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = ~id_1 ? 1 : id_0;
  tri id_4 = 1;
endmodule
module module_2 (
    input  wor  id_0,
    output wand id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
endmodule
module module_4 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_9(
      .id_0(1), .id_1(1)
  );
  module_3 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_1,
      id_6,
      id_4,
      id_7,
      id_7,
      id_4,
      id_3,
      id_6,
      id_6,
      id_6
  );
endmodule

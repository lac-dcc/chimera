// Seed: 3157393323
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  assign id_7 = 1;
  assign id_4 = 1;
  assign id_8 = 1 > 1 && id_5 ? id_3 : 1;
  assign module_1.id_1 = 0;
endmodule
macromodule module_1 (
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
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_1,
      id_4,
      id_5,
      id_6,
      id_7
  );
  id_9(
      .id_0(id_1), .id_1(id_6), .id_2(1'b0)
  );
endmodule

// Seed: 2646132884
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wand id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wand id_1;
  assign module_1.id_4 = 0;
  assign id_1 = id_1++;
  parameter id_8 = -1'h0 == id_7++;
  assign id_2 = id_8;
endmodule
module module_1 (
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
  output tri id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_4,
      id_5,
      id_4
  );
  assign id_4 = id_4 < 1;
  assign id_3 = id_4;
  assign id_7 = -1 - id_4 ? -1 : id_6 * id_6[1'b0 :-1'b0] + id_2;
endmodule

// Seed: 2513145009
module module_0 (
    output tri0 id_0,
    output wor id_1,
    input supply1 id_2,
    output tri1 id_3,
    input uwire id_4,
    input wand id_5
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    output supply1 id_2,
    output wand id_3,
    input wor id_4
);
  wire id_6 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1,
      id_4,
      id_4
  );
endmodule
macromodule module_2 (
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
    id_12
);
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_3 #(
    parameter id_5 = 32'd62
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wand id_2;
  input logic [7:0] id_1;
  assign id_4[1] = id_1[id_5];
  assign id_2 = id_2 + 1;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
endmodule

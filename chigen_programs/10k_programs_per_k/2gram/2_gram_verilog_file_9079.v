// Seed: 2893640460
macromodule module_0 (
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
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wand id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_9 = -1;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd98,
    parameter id_3 = 32'd71
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_5,
      id_1,
      id_4,
      id_5,
      id_1,
      id_1
  );
  output wire _id_3;
  inout wire _id_2;
  inout wire id_1;
  logic [{  id_3  {  id_2  }  } : -1] id_6;
endmodule

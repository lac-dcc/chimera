// Seed: 461715149
module module_0;
  logic id_1;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    id_1,
    _id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire _id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  input wire id_1;
  assign id_3[id_2] = -1;
endmodule
module module_2 (
    output supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wand id_3,
    input supply1 id_4,
    input wor id_5,
    output tri id_6
);
  logic id_8;
  parameter int id_9 = 1;
  assign module_3.id_5 = 0;
endmodule
module module_3 (
    output tri1 id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wand id_4,
    input wand id_5
);
  assign id_1 = id_2;
  logic id_7;
  module_2 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_1
  );
  assign id_1 = id_2;
endmodule

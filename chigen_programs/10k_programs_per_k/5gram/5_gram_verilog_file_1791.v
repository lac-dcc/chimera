// Seed: 396160973
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  assign module_1.id_9 = 0;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_10;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output uwire id_7,
    output wand id_8,
    output wand id_9
);
  logic id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
  assign id_2 = 1'd0;
  nor primCall (id_0, id_11, id_4, id_5, id_1, id_6);
endmodule

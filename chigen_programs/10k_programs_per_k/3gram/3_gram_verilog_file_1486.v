// Seed: 1513941273
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
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_2[-1] = id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4
);
  wire  id_6;
  logic id_7 = id_3;
  wire  id_8;
  assign id_7[-1] = id_2;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_6,
      id_6,
      id_8,
      id_6,
      id_6,
      id_6,
      id_8
  );
  logic id_9;
  xor primCall (id_0, id_4, id_2, id_6, id_1);
  parameter id_10 = -1;
  assign id_9 = id_7;
endmodule

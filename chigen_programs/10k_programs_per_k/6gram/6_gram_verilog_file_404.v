// Seed: 1839029847
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input wire id_2,
    input wor id_3,
    output supply1 id_4,
    input uwire id_5,
    output wor id_6,
    input tri0 id_7,
    input wire id_8,
    output wand id_9,
    output wire id_10,
    output tri0 id_11
);
  wand [-1 : 1] id_13, id_14;
  parameter id_15 = 1;
  logic [1 : 1] id_16;
  ;
  assign id_13 = id_2 ? 1 : 1;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input tri1 id_2,
    output supply1 id_3
);
  assign id_3 = -1'b0 ? id_1 : -1 ? id_0 : $realtime;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3
  );
  localparam id_5 = 1 == 1;
  logic id_6;
endmodule

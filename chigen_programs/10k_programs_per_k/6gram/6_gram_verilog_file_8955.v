// Seed: 4030440390
module module_0 (
    input wor id_0,
    input uwire id_1,
    input supply1 id_2,
    output uwire id_3,
    input supply0 id_4,
    output wire id_5,
    input wand id_6,
    output supply0 id_7,
    output wire id_8,
    input wand id_9,
    output wor id_10,
    input supply0 id_11,
    output uwire id_12,
    output supply0 id_13,
    output tri id_14,
    output supply1 id_15
);
  wire id_17;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri0 id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2
  );
  logic [7:0][-1 : -1] id_4;
  reg id_5;
  always id_5 = @({id_4[-1]{-1'b0}}) !(-1);
endmodule

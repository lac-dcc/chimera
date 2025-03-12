// Seed: 107478333
module module_0 (
    output wire id_0
    , id_11,
    input tri1 id_1,
    input wand id_2#(.id_12(1'b0)),
    output uwire id_3,
    output wor id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply1 id_8,
    output uwire id_9
);
  logic id_13;
  ;
  wire id_14;
  assign id_12 = -1;
  wire id_15;
  ;
  assign id_11[-1] = id_15;
  assign id_0 = 1;
  assign module_1.id_4 = 0;
  assign id_11 = id_2;
  wire id_16;
  logic id_17 = id_5;
  union packed {logic id_18 = 1;} id_19;
endmodule
module module_1 #(
    parameter id_2 = 32'd31
) (
    input wand id_0,
    input tri1 id_1,
    input tri0 _id_2,
    input wand id_3,
    input tri0 id_4,
    output supply0 id_5,
    output tri0 id_6,
    output wand id_7#(.id_11(-1)),
    input tri id_8,
    input wire id_9
);
  parameter [id_2 : -1] id_12 = 1;
  assign id_6 = -1;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8,
      id_5,
      id_6
  );
endmodule

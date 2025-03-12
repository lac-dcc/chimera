// Seed: 2287770082
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input tri id_2,
    input supply0 id_3,
    input tri id_4,
    output uwire id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input uwire id_10,
    output wire id_11,
    output wand id_12,
    input tri id_13
);
  wire id_15;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd36
) (
    output tri1  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  wire  _id_3
);
  logic [7:0][1  +:  -1] id_5 = id_3;
  logic [7:0] id_6;
  assign id_6[id_3+:-1] = id_6 == 1;
  wire  id_7;
  logic id_8;
  assign id_5 = id_5;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2
  );
endmodule

// Seed: 3274374017
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    input uwire id_4,
    input wand id_5,
    input wire id_6,
    input uwire id_7,
    output wor id_8,
    output tri0 id_9,
    input wand id_10,
    output wire id_11
);
  wire  id_13;
  logic id_14 = -1;
  initial id_14 = id_13;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    output uwire id_2,
    output wire id_3,
    output tri0 id_4,
    output wand id_5,
    input tri0 id_6,
    output uwire id_7,
    input supply1 id_8,
    output tri1 id_9,
    input wor id_10,
    input wand id_11,
    output tri id_12
);
  always @* begin : LABEL_0
    fork
      $signed(8);
      ;
    join
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_5,
      id_11,
      id_11,
      id_8,
      id_10,
      id_10,
      id_4,
      id_5,
      id_1,
      id_0
  );
  assign modCall_1.id_11 = 0;
endmodule

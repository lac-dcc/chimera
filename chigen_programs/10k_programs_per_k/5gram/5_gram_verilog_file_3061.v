// Seed: 3111920063
module module_0 (
    input uwire id_0,
    input wire id_1,
    input wand id_2,
    output uwire id_3,
    input supply0 id_4,
    input wire id_5,
    output tri0 id_6,
    output wand id_7,
    input tri0 id_8
);
  wor id_10 = id_1;
endmodule
module module_1 (
    output wand id_0
    , id_3,
    input  tri0 id_1
);
  assign id_3[1] = id_1;
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1
  );
endmodule
module module_2 (
    output wand id_0,
    output tri0 id_1,
    output logic id_2,
    output logic id_3,
    input supply0 id_4,
    input logic id_5,
    input wire id_6,
    input wand id_7,
    output uwire id_8
);
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_8,
      id_4,
      id_4,
      id_0,
      id_1,
      id_7
  );
  assign modCall_1.id_4 = 0;
  initial begin : LABEL_0
    if (1) id_2 <= 1;
    else id_3 <= id_5;
  end
endmodule

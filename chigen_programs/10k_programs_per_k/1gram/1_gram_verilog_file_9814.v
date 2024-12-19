// Seed: 2692764300
module module_0 (
    input  wor   id_0,
    input  tri   id_1
    , id_10,
    output uwire id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  wire  id_5,
    output tri   id_6,
    input  tri   id_7,
    output tri0  id_8
);
  wire id_11;
  assign id_8 = id_1;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output wand id_2,
    output logic id_3
    , id_8,
    input logic id_4
    , id_9,
    output wand id_5,
    input wor id_6
);
  assign id_3 = id_4;
  assign id_8 = 1;
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_5,
      id_9,
      id_9,
      id_9,
      id_5,
      id_6,
      id_8
  );
  assign modCall_1.id_3 = 0;
  always_comb begin : LABEL_0
    id_1 <= id_4;
    begin : LABEL_0$display
      ;
    end
    id_8 = id_6;
    id_9 = 1;
  end
  wire id_10;
endmodule

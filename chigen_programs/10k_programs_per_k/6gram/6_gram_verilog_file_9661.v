// Seed: 4034347584
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input supply0 id_2,
    output wand id_3,
    input wire id_4,
    input wire id_5,
    input wand id_6
);
  initial
    if (1) begin : LABEL_0
      disable id_8;
    end
  tri  id_9 = 1;
  wire id_10;
endmodule
module module_1 (
    input  tri0  id_0,
    output wire  id_1,
    input  wor   id_2,
    output wand  id_3,
    input  wor   id_4,
    output logic id_5,
    output tri0  id_6
);
  initial begin : LABEL_0
    id_5 <= id_2;
    assign id_5 = 1;
    id_5 <= -1;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3,
      id_2,
      id_0,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule

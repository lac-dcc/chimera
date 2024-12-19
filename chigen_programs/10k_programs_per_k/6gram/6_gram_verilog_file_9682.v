// Seed: 2360843043
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output wand id_7
    , id_10,
    output supply1 id_8
);
  generate
    for (id_11 = 1'b0; 1; id_10 = 1 == id_4) begin : LABEL_0
      assign id_0 = 1;
    end
  endgenerate
  wire id_12;
  assign module_1.id_3 = 0;
  assign id_0 = 1;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    input  wire  id_2,
    output wor   id_3,
    output tri0  id_4,
    output uwire id_5
    , id_12,
    output wand  id_6,
    output tri0  id_7,
    input  tri1  id_8,
    output logic id_9,
    output wand  id_10
);
  initial begin : LABEL_0
    id_9 <= 1;
    #1;
    assume (1'b0);
  end
  module_0 modCall_1 (
      id_10,
      id_1,
      id_8,
      id_5,
      id_1,
      id_5,
      id_8,
      id_7,
      id_6
  );
endmodule

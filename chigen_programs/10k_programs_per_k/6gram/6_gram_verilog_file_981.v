// Seed: 4124943641
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri id_7,
    output wand id_8,
    output wand id_9
);
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    output logic id_2
);
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= id_1;
    end
    $unsigned(91);
    ;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  wand  id_0,
    input  tri   id_1,
    input  tri   id_2,
    input  tri   id_3,
    input  wire  id_4,
    output wor   id_5,
    input  wand  id_6,
    output wire  id_7,
    output uwire id_8,
    input  tri   id_9,
    output wand  id_10,
    output wand  id_11,
    output wire  id_12
);
  logic id_14;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_12,
      id_9,
      id_9,
      id_8,
      id_6,
      id_9,
      id_11,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule

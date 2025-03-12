// Seed: 3163456993
module module_0 (
    output wire id_0
    , id_14, id_15,
    output wor id_1,
    input wor id_2
    , id_16,
    output tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    output wand id_7,
    output supply1 id_8,
    input tri0 id_9,
    output tri0 id_10,
    output wire id_11,
    output uwire id_12
);
  initial begin : LABEL_0
    #1 release id_5;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wand  id_0,
    input  wire  id_1,
    output tri0  id_2,
    input  wire  id_3,
    output logic id_4
);
  parameter id_6 = 1;
  assign id_4 = id_3;
  nor primCall (id_2, id_3, id_6);
  always_latch @(*) begin : LABEL_0
    id_4 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_0,
      id_1,
      id_2,
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2
  );
endmodule

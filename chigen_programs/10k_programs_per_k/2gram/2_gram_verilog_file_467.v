// Seed: 1322222311
module module_0 (
    input tri0 id_0,
    input tri1 id_1
    , id_9,
    input uwire id_2,
    output wire id_3,
    input wire id_4,
    output wand id_5,
    output tri0 id_6,
    input supply0 id_7
);
  wire id_10;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input tri id_2,
    input wire id_3,
    output tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output wand id_7,
    output uwire id_8,
    input tri1 id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    input supply0 id_13,
    output logic id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_8,
      id_1,
      id_7,
      id_8,
      id_12
  );
  always begin : LABEL_0
    if (1) begin : LABEL_1
      id_14 <= id_13;
    end
  end
endmodule

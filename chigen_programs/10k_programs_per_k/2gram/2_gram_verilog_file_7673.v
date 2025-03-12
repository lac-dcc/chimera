// Seed: 2920720567
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    input wand id_4,
    input wor id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output wand id_9#(.id_19($realtime)),
    input wor id_10,
    output tri0 id_11,
    input wire id_12,
    input supply0 id_13,
    input tri id_14,
    output tri1 id_15,
    input tri1 id_16,
    output supply0 id_17
);
  logic id_20;
  assign module_1.id_5 = 0;
  logic id_21 = id_21;
  logic id_22 = id_12;
  initial id_19 = -1;
  wire id_23;
  wire id_24;
  ;
  assign id_19 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  tri   id_4,
    output wor   id_5,
    input  tri1  id_6,
    output logic id_7,
    input  wire  id_8,
    output tri0  id_9
);
  assign id_7 = -1;
  logic id_11;
  ;
  module_0 modCall_1 (
      id_9,
      id_3,
      id_1,
      id_2,
      id_8,
      id_1,
      id_8,
      id_8,
      id_3,
      id_5,
      id_3,
      id_9,
      id_6,
      id_3,
      id_4,
      id_9,
      id_3,
      id_5
  );
  always_comb begin : LABEL_0
    id_7 <= id_1;
    id_11 = -1;
  end
endmodule

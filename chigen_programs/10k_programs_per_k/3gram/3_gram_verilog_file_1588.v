// Seed: 3865149694
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output supply0 id_2,
    output supply0 id_3,
    output tri id_4,
    input supply1 id_5,
    input tri id_6,
    input tri id_7,
    output wand id_8
    , id_17,
    output tri id_9,
    input tri0 id_10,
    input supply1 id_11,
    input wire id_12,
    input tri0 id_13,
    output tri id_14,
    output supply1 id_15
);
  assign id_4 = $unsigned(24);
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  uwire id_4,
    output logic id_5,
    input  wor   id_6,
    input  wand  id_7
);
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1,
      id_6,
      id_2,
      id_2,
      id_0,
      id_7,
      id_6,
      id_3,
      id_2,
      id_2
  );
  always @(posedge id_0 or posedge 1) $clog2(96);
  ;
  initial begin : LABEL_0
    id_5 <= id_3;
  end
endmodule

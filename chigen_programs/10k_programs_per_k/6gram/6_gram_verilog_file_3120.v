// Seed: 442297171
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input uwire id_4,
    output wor id_5,
    output wand id_6,
    input wire id_7,
    input wand id_8,
    input wand id_9,
    input uwire id_10,
    input tri id_11,
    input tri id_12,
    input tri1 id_13
    , id_19,
    input wand id_14,
    input wire id_15,
    input supply1 id_16
    , id_20,
    input wire id_17
);
  initial forever id_21(id_8);
  wire id_22;
  ;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6
    , id_17,
    output wire id_7,
    input tri id_8,
    input tri0 id_9,
    input tri id_10,
    output wire id_11,
    output tri0 id_12,
    output logic id_13,
    input supply1 id_14,
    input tri0 id_15
);
  always @(posedge {id_2{(1 - id_3) == -1}} or id_17) begin : LABEL_0
    id_13#(.id_0(-1)) = id_9;
    disable id_18;
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_12,
      id_1,
      id_7,
      id_11,
      id_1,
      id_2,
      id_15,
      id_9,
      id_9,
      id_10,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2
  );
  assign id_13 = id_17;
endmodule

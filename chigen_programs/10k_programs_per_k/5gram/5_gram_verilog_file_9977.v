// Seed: 3308041868
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input supply1 id_3
    , id_7,
    input uwire id_4,
    input tri id_5
);
  assign id_1 = id_4;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    output logic id_6,
    input logic id_7,
    output wand id_8,
    input tri id_9,
    output uwire id_10,
    input uwire id_11,
    input wor id_12,
    input logic id_13
);
  assign id_3 = id_2;
  wire id_15;
  wire id_16, id_17;
  always_ff @(id_7 or id_13) begin : LABEL_0
    assume #1  (1 == id_7) $display(id_2);
    id_8 = id_4;
    id_6#(.id_15(1)) <= id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_8,
      id_2,
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.type_1 = 0;
endmodule

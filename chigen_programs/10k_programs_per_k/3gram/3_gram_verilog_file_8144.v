// Seed: 402138922
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input wire id_3,
    input wand id_4,
    output supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wor id_8,
    output uwire id_9,
    input supply1 id_10
);
  wand id_12 = id_3;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input wor id_0,
    input logic id_1,
    input tri id_2
    , id_15,
    output supply1 id_3,
    input uwire id_4,
    output wor id_5,
    input tri1 id_6,
    output tri0 id_7,
    input supply1 id_8,
    output wor id_9,
    output logic id_10,
    input wor id_11,
    output supply1 id_12,
    output wire id_13
);
  always @(*)
    if (id_2) begin : LABEL_0
      id_10 <= id_1;
    end
  wire id_16, id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_0,
      id_4,
      id_5,
      id_8,
      id_11,
      id_2,
      id_7,
      id_4
  );
  wire id_18;
  assign id_12 = 0;
  wand id_19;
  initial begin : LABEL_0
    id_19#(.id_4(1)) = 1;
  end
endmodule

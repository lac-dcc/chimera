// Seed: 501631323
module module_0 (
    input uwire id_0,
    output wand id_1,
    output uwire id_2,
    output wire id_3,
    input wire id_4,
    input wire id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply1 id_8
);
  assign module_1.id_9 = 0;
  logic id_10 = id_7;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    output wor id_2,
    input tri id_3,
    output logic id_4
    , id_20,
    input wor id_5,
    input tri id_6,
    input supply1 id_7
    , id_21,
    output supply1 id_8,
    output wor id_9,
    input tri1 id_10,
    input wor id_11,
    input supply0 id_12,
    output supply0 id_13,
    input tri1 id_14,
    input wor id_15,
    input tri1 id_16,
    input wor id_17,
    output uwire id_18
);
  always @(negedge id_15) begin : LABEL_0
    wait (id_12);
    if (1) id_4 <= id_11;
  end
  module_0 modCall_1 (
      id_0,
      id_13,
      id_2,
      id_8,
      id_3,
      id_3,
      id_14,
      id_12,
      id_14
  );
endmodule

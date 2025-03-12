// Seed: 592512019
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    output wor module_0,
    input tri0 id_5,
    input supply1 id_6,
    output tri id_7,
    output tri0 id_8
);
  assign id_4 = 1'b0;
endmodule
module module_0 (
    input tri1 id_0,
    input wire id_1,
    output logic id_2,
    output tri1 id_3,
    input tri0 id_4,
    output logic id_5,
    input tri0 id_6,
    output supply0 id_7,
    output logic id_8,
    input tri1 id_9,
    input tri0 id_10,
    output tri id_11,
    output tri0 id_12,
    output wand id_13
);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_9,
      id_13,
      id_9,
      id_6,
      id_13,
      id_11
  );
  always @(*) begin : LABEL_0
    `define pp_15 0
    disable id_16;
    begin : LABEL_1
      id_5 <= -1;
      id_2 <= module_1 & id_9;
    end
    id_2 = id_10;
    {1 != id_6 - id_9, id_6} = -1 == -1;
    if (1) begin : LABEL_2
      disable `pp_15;
    end else id_5 <= id_10;
  end
  wire [-1 : -1] id_17;
  logic id_18;
  always_latch @(id_0 & -1 == ~id_0 or posedge id_0) id_8 <= id_9;
endmodule

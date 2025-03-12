// Seed: 826261790
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output logic id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wire id_6
    , id_20,
    output tri0 id_7,
    input tri1 id_8,
    input tri0 id_9,
    output tri id_10,
    input tri id_11,
    input uwire id_12,
    output uwire id_13,
    input wire id_14,
    input wire id_15,
    input wor id_16,
    output wand id_17,
    output supply0 id_18
);
  logic id_21;
  always @(posedge -1 or negedge |id_12 != id_20) begin : LABEL_0
    id_3 = -1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2
);
  always @* begin : LABEL_0
    if (1) begin : LABEL_1
      id_1 <= 1'b0;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule

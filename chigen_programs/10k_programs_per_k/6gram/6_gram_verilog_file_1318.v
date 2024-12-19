// Seed: 1949043286
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    input uwire id_3
    , id_10,
    input wor id_4,
    input uwire id_5,
    input wire id_6,
    output supply0 id_7,
    output wor id_8
);
  wire id_11;
  wire id_12;
  always @(1'b0 or negedge id_2) begin : LABEL_0
    id_0 = 1;
  end
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    output logic id_5,
    output tri1 id_6,
    input wire id_7,
    input tri0 id_8
    , id_20,
    input wor id_9,
    input wand id_10,
    input tri0 id_11,
    output logic id_12,
    input supply1 id_13,
    input supply1 id_14,
    input supply1 id_15,
    input logic id_16,
    input supply0 id_17,
    output uwire id_18
);
  always @(negedge 1) begin : LABEL_0
    id_5 <= 1'h0;
  end
  initial begin : LABEL_0
    id_5  <= {1, 1};
    id_12 <= id_16;
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_15,
      id_4,
      id_4,
      id_2,
      id_13,
      id_18,
      id_6
  );
endmodule

// Seed: 2436680915
module module_0 (
    output tri   id_0,
    output tri   id_1,
    output logic id_2,
    output wand  id_3,
    output logic id_4,
    output logic id_5,
    output wire  id_6,
    input  logic id_7,
    output wire  id_8
);
  assign id_3 = 1;
  assign module_1.id_6 = 0;
  initial begin : LABEL_0
    `define pp_10 0
    id_4 <= #1 id_7;
    id_5 += 1;
    id_5 <= {`pp_10, `pp_10, 1, 1, 1, 1, 1, 1} > 1;
    id_2 <= id_7;
    id_1 = 1;
    if (1 ^ `pp_10 < id_7) id_5 <= 1 === 1;
    else id_5 <= ~`pp_10;
  end
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply0 id_6
    , id_24,
    input wand id_7,
    output supply0 id_8,
    output wor id_9,
    input wand id_10,
    output supply1 id_11,
    input tri1 id_12,
    input logic id_13,
    input uwire id_14,
    output logic id_15,
    input wand id_16,
    output tri1 id_17,
    input supply1 id_18,
    input tri1 id_19,
    output uwire id_20,
    output supply1 id_21,
    output tri0 id_22
);
  assign id_8 = id_0 - id_16;
  always @(negedge 1'h0) begin : LABEL_0
    id_15 <= id_0 ? id_24 : id_13;
  end
  module_0 modCall_1 (
      id_22,
      id_17,
      id_15,
      id_17,
      id_15,
      id_24,
      id_20,
      id_24,
      id_22
  );
endmodule

// Seed: 4094918263
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output tri1 id_2,
    output tri0 id_3,
    output wire id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri id_7,
    input tri id_8,
    input supply0 id_9,
    input supply0 id_10,
    output tri id_11,
    input supply0 id_12
);
  wire id_14;
endmodule
module module_0 #(
    parameter id_10 = 32'd39
) (
    output logic id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    input uwire id_4,
    input wire id_5,
    output supply1 id_6,
    input wand id_7,
    input wor id_8,
    output wire id_9,
    input wor module_1,
    output tri id_11,
    input supply0 id_12,
    input tri0 id_13,
    output logic id_14,
    input supply1 id_15
);
  string id_17 = "";
  logic [$realtime : id_10] id_18;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_6,
      id_9,
      id_5,
      id_8,
      id_13,
      id_2,
      id_7,
      id_4,
      id_9,
      id_3
  );
  assign modCall_1.id_2 = 0;
  always_comb @(posedge -1 or id_12) begin : LABEL_0
    id_14 = id_10 == 1;
    id_0 <= #1 id_18;
    if (1) id_0 <= -1;
  end
endmodule

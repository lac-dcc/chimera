// Seed: 1069383993
module module_0 (
    input  logic id_0,
    input  wand  id_1,
    output logic id_2
);
  always @(posedge id_1) begin : LABEL_0
    id_2 <= 1 == id_1;
    id_2 = 1 != 1;
    id_2 = id_0;
  end
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    input wire id_2,
    input supply0 id_3,
    output tri1 id_4,
    input uwire id_5,
    input logic id_6,
    output tri0 id_7,
    output supply1 id_8,
    input uwire id_9,
    output wand id_10,
    input wor id_11,
    output tri0 id_12,
    output logic id_13,
    input wand id_14,
    output wire id_15,
    input uwire id_16,
    input uwire id_17,
    input wor id_18,
    input tri0 id_19,
    input uwire id_20,
    output tri0 id_21
);
  always @(posedge (id_5 || 1'b0)) if (id_9) id_13 <= id_6;
  module_0 modCall_1 (
      id_6,
      id_16,
      id_13
  );
  assign modCall_1.id_0 = 0;
endmodule

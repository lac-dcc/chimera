// Seed: 2141836532
module module_0 (
    output tri1 id_0,
    input wire id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    output tri0 id_5,
    output supply1 id_6
);
  generate
    if (id_4) begin : LABEL_0
      assign id_0 = id_3 ? 1 !== id_1 : 1 ? id_2 : 1 ? id_2 : 1 ? id_4 : id_1;
    end else begin : LABEL_0
      genvar id_8;
      wire id_9;
    end
  endgenerate
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output wand id_0,
    input logic id_1,
    input wand id_2,
    input tri0 id_3,
    input tri1 id_4
    , id_13,
    input tri1 id_5,
    output logic id_6,
    input wand id_7,
    input wire id_8,
    input wor id_9,
    input supply0 id_10,
    output wand id_11
);
  always @(posedge ((1)) - ~id_2) begin : LABEL_0
    id_6 <= (id_1);
    id_6 = 1;
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_2,
      id_11,
      id_0
  );
endmodule

// Seed: 896686086
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output wire id_2,
    output tri1 id_3,
    output wand id_4,
    output tri id_5,
    input wand module_0,
    input uwire id_7,
    input wor id_8,
    input tri id_9,
    input supply0 id_10
);
  assign id_5 = 1;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1,
    output logic id_2,
    input wire id_3,
    input wire id_4,
    input tri1 id_5,
    output tri id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    output supply1 id_10,
    input wire id_11,
    input wire id_12,
    input wire id_13,
    output wor id_14,
    input supply1 id_15
);
  wire id_17;
  initial begin : LABEL_0
    if (id_13) id_2 <= id_0;
    else begin : LABEL_0
      id_7 = 1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_14,
      id_6,
      id_7,
      id_9,
      id_14,
      id_8,
      id_12,
      id_8,
      id_15,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule

// Seed: 554612152
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input tri id_4,
    input wire id_5,
    output tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    input uwire id_9,
    input wor id_10,
    output uwire id_11,
    input wor id_12,
    output tri id_13,
    input tri id_14,
    input supply0 id_15,
    input uwire id_16,
    output wand id_17,
    input tri0 id_18,
    output tri1 id_19,
    output tri0 id_20,
    input tri0 id_21,
    input supply1 id_22
);
  assign id_20 = id_3 != id_15;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wor id_3,
    input supply0 id_4,
    input supply0 id_5,
    input logic id_6,
    output wor id_7,
    output supply1 id_8,
    input wor id_9,
    output wire id_10,
    input uwire id_11,
    output logic id_12,
    output supply0 id_13,
    input tri0 id_14
);
  always @(1, posedge 1) begin : LABEL_0
    if ("") begin : LABEL_0
      id_12 = #(id_6) 1;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_5,
      id_9,
      id_7,
      id_14,
      id_8,
      id_4,
      id_1,
      id_4,
      id_3,
      id_4,
      id_7,
      id_10,
      id_2,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule

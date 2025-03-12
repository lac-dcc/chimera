// Seed: 165252448
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    input wor id_6,
    input wor id_7,
    input supply0 id_8,
    output supply0 id_9,
    input wand id_10,
    output uwire module_0
);
  assign id_5 = -1;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output tri1 id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    output logic id_6,
    output wand id_7,
    input supply0 id_8,
    output wor id_9,
    input wor module_1,
    input wire id_11,
    input tri1 id_12,
    input tri1 id_13
);
  module_0 modCall_1 (
      id_12,
      id_7,
      id_8,
      id_7,
      id_12,
      id_9,
      id_11,
      id_13,
      id_11,
      id_9,
      id_1,
      id_9
  );
  assign modCall_1.id_4 = 0;
  always @(posedge id_13 - -1'd0 or -1 != 1) begin : LABEL_0
    id_6 <= id_10;
  end
  wire id_15;
  wire id_16;
endmodule

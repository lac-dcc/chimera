// Seed: 3608312325
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    output wire id_5,
    input tri1 id_6,
    output tri0 id_7,
    output wand id_8,
    input wor id_9,
    output tri0 id_10,
    input wire id_11,
    output supply0 id_12,
    input tri id_13,
    input tri1 id_14,
    output uwire id_15,
    output wire id_16,
    input wand id_17,
    output tri0 id_18,
    output supply0 id_19
);
  wire id_21;
  assign id_10 = id_0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output supply0 id_2,
    input supply0 id_3
);
  always @(posedge id_0 or posedge id_1 or id_3) begin : LABEL_0
    id_2 = 1 + 1'b0;
    $display(1);
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_15 = 0;
  assign id_2 = id_0;
endmodule

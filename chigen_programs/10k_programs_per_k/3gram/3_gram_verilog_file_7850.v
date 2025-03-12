// Seed: 3464416188
module module_0 (
    input wand id_0,
    output uwire id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply0 id_4
);
  always @(negedge -1) begin : LABEL_0
    #1;
  end
endmodule
module module_0 (
    input wire module_1,
    output tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    output wand id_6,
    input tri id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output tri0 id_11,
    output tri1 id_12,
    input tri0 id_13,
    input tri id_14,
    input wire id_15,
    input tri id_16,
    output uwire id_17,
    input tri1 id_18,
    input supply1 id_19,
    output tri1 id_20,
    input wire id_21,
    output wire id_22,
    output supply1 id_23
);
  localparam id_25 = 1'b0;
  nor primCall (
      id_17,
      id_13,
      id_2,
      id_9,
      id_16,
      id_15,
      id_18,
      id_5,
      id_25,
      id_21,
      id_14,
      id_8,
      id_3,
      id_4,
      id_10,
      id_7,
      id_19
  );
  module_0 modCall_1 (
      id_7,
      id_20,
      id_20,
      id_14,
      id_17
  );
  assign modCall_1.id_2 = 0;
endmodule

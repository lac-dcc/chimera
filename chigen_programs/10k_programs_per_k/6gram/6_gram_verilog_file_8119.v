// Seed: 2287564812
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    output wor id_4,
    input wand id_5,
    output uwire id_6,
    input supply1 id_7,
    output wand id_8,
    input wire id_9,
    input tri0 id_10,
    input wand id_11,
    input wand id_12,
    input tri0 id_13,
    input tri0 id_14,
    input supply1 id_15,
    output tri0 id_16,
    output tri0 id_17,
    input wire id_18,
    input supply0 id_19,
    input wand id_20,
    output wire id_21
);
endmodule
module module_1 (
    input  uwire   id_0,
    output logic   id_1,
    output logic   id_2,
    output supply1 id_3
);
  always @(1, posedge id_0) begin : LABEL_0
    id_2 <= -1'o0;
    id_1 <= id_0;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule

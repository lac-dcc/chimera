// Seed: 518272190
module module_0 (
    output wire id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    input wor id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wand id_8,
    input wand id_9,
    output uwire id_10,
    output tri0 id_11,
    output supply1 id_12,
    input wand id_13,
    output wand id_14,
    output supply0 id_15
);
  wire id_17;
  assign id_0  = 1 && id_3;
  assign id_10 = id_9;
  wire id_18;
  wire id_19;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input supply1 id_2,
    output wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output logic id_7,
    input wor id_8,
    input tri1 id_9,
    input tri id_10,
    output wand id_11,
    input supply1 id_12,
    input wand id_13,
    output wire id_14,
    output wand id_15
);
  always @(posedge 1'b0) begin : LABEL_0
    id_7 = #id_17 1;
  end
  module_0 modCall_1 (
      id_0,
      id_5,
      id_13,
      id_5,
      id_1,
      id_4,
      id_8,
      id_12,
      id_2,
      id_13,
      id_4,
      id_14,
      id_3,
      id_12,
      id_14,
      id_0
  );
endmodule

// Seed: 582809698
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input wire id_2,
    output tri id_3,
    output logic id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply1 id_7
    , id_14,
    output tri0 id_8,
    output tri1 id_9,
    output wire id_10,
    input wand id_11,
    output tri id_12
);
  initial begin : LABEL_0
    wait (id_14);
    id_4 <= 1'b0;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input tri id_4,
    output logic id_5,
    input wor id_6,
    input supply1 id_7
    , id_23,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    output wand id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14,
    output wor id_15,
    input wor id_16,
    output tri1 id_17,
    input tri id_18,
    output wand id_19,
    input supply1 id_20,
    output wand id_21
);
  always @(negedge 1) id_5 <= (id_13 ? 1 : id_4 & 1);
  module_0 modCall_1 (
      id_19,
      id_10,
      id_13,
      id_3,
      id_5,
      id_0,
      id_13,
      id_7,
      id_19,
      id_19,
      id_14,
      id_8,
      id_3
  );
endmodule

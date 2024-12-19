// Seed: 3725845973
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    output wor id_7
);
  assign id_2 = id_5 - 1;
  assign id_7 = !id_0;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    output wand id_11,
    input tri0 id_12,
    output tri id_13,
    output supply0 id_14,
    input wire id_15,
    input tri1 id_16
    , id_26,
    input wand id_17,
    input uwire id_18,
    output supply0 id_19,
    output tri0 id_20,
    output tri0 id_21,
    output wire id_22,
    input tri1 id_23,
    output logic id_24
);
  module_0 modCall_1 (
      id_2,
      id_10,
      id_20,
      id_21,
      id_20,
      id_18,
      id_2,
      id_22
  );
  uwire id_27 = 1;
  xor primCall (
      id_22,
      id_0,
      id_18,
      id_26,
      id_17,
      id_9,
      id_12,
      id_1,
      id_2,
      id_7,
      id_10,
      id_4,
      id_3,
      id_15,
      id_5,
      id_23,
      id_6
  );
  initial begin : LABEL_0
    deassign id_11;
    id_24 <= id_26;
  end
endmodule

// Seed: 2615045928
module module_0 (
    output uwire id_0,
    input wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    output tri id_5,
    input wor id_6,
    input supply1 id_7,
    input supply1 id_8,
    output wor id_9,
    output wor id_10,
    input wor id_11,
    output tri0 id_12,
    output tri id_13,
    input tri1 id_14,
    input tri1 id_15,
    output wand id_16,
    output tri0 id_17,
    input supply0 id_18,
    input wor id_19,
    input wor id_20,
    input wand id_21,
    output supply0 id_22,
    input wand id_23,
    output tri0 id_24,
    input wor id_25,
    input wire id_26,
    input wor id_27,
    input supply0 id_28,
    input wand id_29
);
  assign id_0 = 1;
  assign module_1.id_5 = 0;
  wire id_31, id_32, id_33, id_34, id_35, id_36, id_37, id_38, id_39, id_40, id_41, id_42;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input wire id_2,
    output logic id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply0 id_6,
    input uwire id_7,
    input wire id_8,
    input wor id_9,
    input tri0 id_10,
    input wire id_11,
    output uwire id_12
);
  always begin : LABEL_0
    id_3 <= id_10 == id_9;
  end
  or primCall (id_3, id_1, id_8, id_9, id_7, id_0);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_12,
      id_12,
      id_12,
      id_7,
      id_10,
      id_10,
      id_6,
      id_6,
      id_0,
      id_6,
      id_6,
      id_8,
      id_7,
      id_12,
      id_6,
      id_7,
      id_2,
      id_9,
      id_1,
      id_12,
      id_10,
      id_12,
      id_1,
      id_7,
      id_11,
      id_0,
      id_10
  );
endmodule

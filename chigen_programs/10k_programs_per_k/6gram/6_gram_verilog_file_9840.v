// Seed: 3446604681
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input uwire id_8,
    input wor id_9,
    input wor id_10,
    output tri1 id_11,
    output tri1 id_12,
    output wand id_13,
    output uwire id_14,
    input supply0 id_15,
    output tri1 id_16,
    input tri1 id_17,
    output tri0 id_18,
    output supply0 id_19,
    input tri1 id_20,
    input tri id_21,
    input supply0 id_22,
    input tri id_23,
    output wor id_24,
    input wire id_25,
    input tri id_26,
    output tri1 id_27,
    input tri1 id_28,
    output wand id_29,
    input tri id_30,
    output wand id_31,
    input uwire id_32,
    output wor id_33
);
  wire id_35;
  wire id_36;
  wire id_37;
  supply0 id_38 = 1;
  wire id_39;
  wire id_40;
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    output wand id_2,
    output supply1 id_3,
    output logic id_4,
    input wand id_5
);
  tri  id_7;
  wire id_8;
  always @(1 == id_8) begin : LABEL_0
    force id_3.id_7 = 1 ^ id_7;
  end
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_0,
      id_0,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2,
      id_5,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_5,
      id_1,
      id_0,
      id_2,
      id_5,
      id_3,
      id_0,
      id_2
  );
  assign modCall_1.id_11 = 0;
  initial id_4 <= $display((1) == id_0);
endmodule

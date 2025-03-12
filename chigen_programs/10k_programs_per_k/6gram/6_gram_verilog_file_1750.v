// Seed: 4042886363
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input wand id_2,
    output wor id_3,
    output uwire id_4,
    input supply1 id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    output supply0 id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input supply1 id_13,
    output tri0 id_14,
    input tri1 id_15,
    output wand id_16,
    output uwire id_17,
    input uwire id_18,
    output supply0 id_19,
    input uwire id_20,
    input supply0 id_21,
    input tri id_22,
    input supply1 id_23,
    input tri id_24,
    output supply1 id_25,
    output uwire id_26
);
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1,
    input wor id_2,
    output uwire id_3,
    input wor id_4,
    output tri id_5,
    output uwire id_6,
    input uwire id_7,
    input wand id_8,
    output supply0 id_9
);
  wire id_11;
  assign id_6 = ~id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_7,
      id_9,
      id_9,
      id_2,
      id_6,
      id_8,
      id_4,
      id_6,
      id_2,
      id_8,
      id_4,
      id_4,
      id_1,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_8,
      id_2,
      id_4,
      id_8,
      id_7,
      id_6,
      id_5
  );
  assign modCall_1.id_7 = 0;
  supply0 id_12 = -1;
  wire id_13;
  generate
    if ({-1, 1 & 1 ==? -1}) begin : LABEL_0
      logic id_14;
      ;
      wire id_15;
      ;
    end else begin : LABEL_1
      assign id_3 = 1 ? id_12 - 1 : id_11;
    end
  endgenerate
  logic [1 : -1] id_16;
  ;
endmodule

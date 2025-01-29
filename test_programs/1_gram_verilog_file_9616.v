// Seed: 1737992541
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    output tri0 id_3,
    output wand id_4,
    output wor id_5,
    output uwire id_6,
    input wor id_7,
    input tri0 id_8,
    output tri1 id_9,
    output wor id_10,
    output tri1 id_11,
    output supply0 id_12,
    input supply0 id_13#(.id_15(1))
);
  generate
    assign id_4.id_7 = $display;
    begin : LABEL_0
      wire id_16;
      assign id_6 = 1;
    end
  endgenerate
  parameter id_17 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wand id_5,
    output wor id_6,
    output uwire id_7,
    output wand id_8,
    input wand id_9,
    input uwire id_10,
    id_36,
    output wire id_11,
    output wand id_12,
    output tri0 id_13,
    input wand id_14,
    input tri1 id_15,
    input tri1 id_16,
    input tri0 id_17,
    input uwire id_18,
    input wire id_19,
    input uwire id_20,
    input supply1 id_21,
    output tri1 id_22,
    output supply1 id_23,
    input tri1 id_24,
    output wire id_25,
    input wire id_26,
    input tri id_27,
    input supply1 id_28,
    input supply0 id_29,
    input supply0 id_30,
    input supply0 id_31,
    input tri1 id_32,
    input supply1 id_33,
    output uwire id_34
);
  parameter id_37 = ~id_4;
  assign id_13 = id_3;
  wire id_38 = id_37[-1];
  xnor primCall (
      id_1,
      id_19,
      id_32,
      id_9,
      id_33,
      id_38,
      id_16,
      id_24,
      id_17,
      id_26,
      id_36,
      id_4,
      id_27,
      id_37,
      id_18,
      id_14,
      id_30,
      id_2,
      id_3,
      id_31,
      id_10,
      id_29,
      id_15,
      id_20,
      id_28,
      id_21
  );
  module_0 modCall_1 (
      id_14,
      id_9,
      id_8,
      id_8,
      id_12,
      id_1,
      id_23,
      id_9,
      id_15,
      id_11,
      id_11,
      id_1,
      id_7,
      id_19
  );
endmodule

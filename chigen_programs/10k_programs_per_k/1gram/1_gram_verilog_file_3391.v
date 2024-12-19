// Seed: 927862364
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input supply0 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wor id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9,
    output wire id_10,
    input uwire id_11,
    output tri0 id_12,
    output tri0 id_13,
    output supply0 id_14,
    input supply0 id_15,
    output supply0 id_16,
    output wor id_17,
    input supply0 id_18
);
  final $display(id_1, 1);
  assign module_1.id_6 = 0;
  assign id_17 = 1'h0;
  wire id_20;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output logic id_2,
    output tri1 id_3,
    input wire id_4,
    output supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    output tri0 id_8,
    input wand id_9,
    input wor id_10,
    input tri void id_11,
    input wand id_12,
    output supply1 id_13,
    input uwire id_14,
    input tri1 id_15,
    input tri1 id_16,
    input tri0 id_17,
    input wand id_18,
    output supply1 id_19
);
  assign id_19 = 1;
  assign id_5  = id_10;
  supply1 id_21, id_22, id_23, id_24, id_25;
  assign id_25 = (1) - id_25 & 1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_18,
      id_9,
      id_10,
      id_18,
      id_0,
      id_17,
      id_4,
      id_9,
      id_3,
      id_17,
      id_3,
      id_19,
      id_19,
      id_12,
      id_8,
      id_3,
      id_4
  );
  integer id_26 (id_18);
  always begin : LABEL_0
    id_2 <= 1;
  end
endmodule

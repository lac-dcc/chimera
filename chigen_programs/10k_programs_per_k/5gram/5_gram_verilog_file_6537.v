// Seed: 2732566714
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    input wor id_5,
    output wand id_6,
    output supply0 id_7,
    output supply1 id_8,
    input tri0 id_9
    , id_21,
    input tri0 id_10,
    input tri1 id_11,
    output tri0 id_12
    , id_22,
    output tri id_13,
    input tri id_14,
    input uwire id_15,
    input uwire id_16,
    output wire id_17,
    output wand id_18,
    input tri id_19
);
  final $display(id_2);
  wire id_23;
  wire id_24;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input wire id_2,
    output logic id_3,
    output wire id_4
);
  always
    repeat (1) begin : LABEL_0
      #1;
      id_3 <= 1;
      id_3 <= id_2 ^ 1 - 1 ^ 1 ~^ id_2;
    end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_2,
      id_0,
      id_0,
      id_2,
      id_1,
      id_4,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_4,
      id_0
  );
  assign modCall_1.type_6 = 0;
endmodule

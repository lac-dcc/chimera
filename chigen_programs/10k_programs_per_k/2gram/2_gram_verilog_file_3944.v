// Seed: 2972405737
module module_0 (
    output uwire id_0,
    input  tri0  id_1
);
  wire [1 : 1] id_3;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input wor id_2,
    inout supply1 id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input uwire id_7,
    output tri1 id_8,
    output logic id_9,
    input wor id_10,
    output supply1 id_11,
    input tri0 id_12,
    input tri id_13,
    output tri1 id_14,
    output wor id_15,
    input wand id_16,
    input supply1 id_17,
    input wire id_18,
    input wand id_19,
    input tri id_20,
    output tri0 id_21,
    output supply0 id_22,
    input tri id_23,
    input uwire id_24,
    output tri0 id_25,
    output uwire id_26
    , id_29,
    input tri1 id_27
);
  final begin : LABEL_0
    $unsigned(33);
    ;
  end
  nor primCall (
      id_15,
      id_23,
      id_6,
      id_17,
      id_2,
      id_3,
      id_1,
      id_4,
      id_16,
      id_7,
      id_13,
      id_20,
      id_10,
      id_0,
      id_29,
      id_18,
      id_12,
      id_30,
      id_5,
      id_24,
      id_19
  );
  always_latch id_9 <= id_18;
  assign id_3 = 1;
  wire id_30;
  ;
  module_0 modCall_1 (
      id_8,
      id_27
  );
  assign id_29[1] = id_30;
  logic id_31 = id_30;
endmodule

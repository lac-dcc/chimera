// Seed: 1664229997
module module_0 (
    output supply1 id_0,
    output wire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    input wand id_6,
    input uwire id_7,
    input wand id_8
    , id_23,
    input supply0 id_9,
    input tri id_10,
    input wand id_11,
    output wire id_12,
    output supply0 id_13,
    output wor id_14,
    output supply0 id_15,
    output uwire id_16,
    output tri0 id_17,
    input wand id_18,
    input tri0 id_19,
    input tri id_20,
    input tri0 id_21
);
  parameter id_24 = 1;
  wire id_25;
  ;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    inout wand id_2,
    input wand id_3,
    output tri1 id_4,
    input supply1 id_5,
    input uwire id_6
);
  initial begin : LABEL_0
    id_0 = $realtime;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_6,
      id_2,
      id_5,
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_6,
      id_3,
      id_3
  );
  assign id_4 = id_3;
endmodule

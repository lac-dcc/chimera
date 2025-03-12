// Seed: 534848003
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output uwire id_2,
    input supply0 id_3,
    input wand id_4,
    output tri id_5,
    output wand id_6,
    input tri1 id_7,
    output wire id_8,
    input uwire id_9,
    input uwire id_10,
    input tri id_11,
    input wire id_12
);
  wire \id_14 ;
  parameter id_15 = 1;
  wire id_16;
  wire id_17;
  assign id_8 = 1'h0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input uwire id_2
    , id_24,
    input tri id_3,
    input tri0 id_4,
    output wand id_5,
    input wire id_6,
    output tri0 id_7,
    input wand id_8,
    input supply0 id_9,
    input wor id_10,
    input tri1 id_11,
    output uwire id_12,
    input wor id_13,
    output tri0 id_14,
    input wor id_15,
    input uwire id_16,
    input uwire id_17,
    input tri1 id_18,
    output logic id_19
    , id_25,
    input tri id_20,
    input supply0 id_21
    , id_26,
    input wire id_22
);
  wire id_27;
  nor primCall (
      id_1,
      id_4,
      id_11,
      id_9,
      id_13,
      id_20,
      id_3,
      id_10,
      id_22,
      id_18,
      id_25,
      id_27,
      id_16,
      id_0,
      id_24,
      id_8,
      id_15,
      id_2,
      id_6,
      id_21,
      id_26
  );
  assign id_19 = 1;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_14,
      id_11,
      id_17,
      id_1,
      id_14,
      id_3,
      id_5,
      id_20,
      id_17,
      id_22,
      id_17
  );
  always begin : LABEL_0
    id_19 <= #1 1;
  end
  wire id_28;
endmodule

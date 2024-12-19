// Seed: 167672357
module module_0 ();
  wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7[1] = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    input wor id_3,
    input wand id_4,
    input uwire id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input uwire id_9,
    input supply0 id_10,
    input wire id_11,
    input tri0 id_12,
    input wand id_13,
    output wand id_14,
    input tri0 id_15,
    input tri0 id_16,
    input supply1 id_17
    , id_26,
    output wand id_18,
    output wire id_19,
    output supply0 id_20,
    input tri1 id_21,
    input uwire id_22,
    input tri0 id_23,
    input wor id_24
);
  wire id_27;
  wire id_28;
endmodule
module module_3 (
    output wire id_0,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    output logic id_4,
    input supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    input wand id_8,
    output uwire id_9,
    input tri0 id_10,
    input supply0 id_11,
    input tri0 id_12,
    input wand id_13,
    output tri1 id_14,
    input wand id_15,
    output logic id_16,
    output wor id_17,
    input wor id_18,
    output wor id_19,
    output tri id_20
);
  wire id_22;
  initial begin : LABEL_0
    if (1) id_4 <= 1 | {id_12, id_10};
    else id_16 <= #1 1 & 1 & id_15;
    $display;
  end
  wire id_23;
  module_2 modCall_1 (
      id_18,
      id_11,
      id_13,
      id_10,
      id_11,
      id_2,
      id_14,
      id_11,
      id_6,
      id_2,
      id_11,
      id_8,
      id_7,
      id_2,
      id_19,
      id_10,
      id_10,
      id_18,
      id_17,
      id_17,
      id_20,
      id_2,
      id_1,
      id_1,
      id_6
  );
  assign modCall_1.type_13 = 0;
endmodule

// Seed: 1972416544
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri id_4,
    input wire id_5,
    input tri id_6,
    input wand id_7,
    input tri0 id_8,
    input wire id_9,
    input wand id_10,
    output wire id_11,
    output tri0 id_12,
    output tri0 id_13,
    output supply0 id_14,
    input uwire id_15
    , id_26,
    output wire id_16,
    output tri0 id_17,
    input uwire id_18,
    output tri0 id_19,
    input wire id_20,
    output uwire id_21,
    input tri0 id_22,
    output tri1 id_23,
    output tri0 id_24
);
  assign id_14 = id_20 ? -1 : id_3;
  assign id_13 = 1;
  assign module_1.id_20 = 0;
  logic id_27;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd72
) (
    input tri1 id_0,
    inout tri id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output logic id_5,
    output tri id_6,
    output logic id_7,
    input uwire id_8,
    input wor id_9,
    input supply1 id_10,
    input tri1 id_11,
    input tri1 _id_12,
    input uwire id_13
    , id_27,
    output tri0 id_14,
    output tri id_15,
    input tri id_16,
    input tri id_17,
    input wor id_18,
    input tri0 id_19,
    output tri id_20,
    input tri1 id_21,
    input tri1 id_22,
    input wire id_23,
    output wor id_24,
    input wor id_25
);
  logic [{  -1  {  -1 'b0 }  } : id_12] id_28;
  module_0 modCall_1 (
      id_21,
      id_15,
      id_15,
      id_11,
      id_13,
      id_2,
      id_17,
      id_25,
      id_10,
      id_21,
      id_18,
      id_1,
      id_1,
      id_20,
      id_20,
      id_25,
      id_6,
      id_1,
      id_21,
      id_24,
      id_0,
      id_14,
      id_4,
      id_14,
      id_24
  );
  initial begin : LABEL_0
    id_27 <= "";
    id_7 = #id_29 id_21;
    id_5 = id_25;
  end
endmodule

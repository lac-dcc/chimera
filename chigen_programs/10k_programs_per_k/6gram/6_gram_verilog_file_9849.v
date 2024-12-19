// Seed: 2039379896
module module_0 (
    output wire id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    output tri id_5,
    input tri0 id_6,
    input wire id_7,
    output supply0 id_8,
    output wor id_9,
    output supply0 id_10,
    input wire id_11,
    input wand id_12,
    input tri id_13
);
  wire id_15;
  supply0 id_16;
  assign id_16 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    output logic id_2
    , id_30,
    input tri id_3,
    inout supply0 id_4,
    input logic id_5,
    output wire id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input supply1 id_10,
    output tri id_11,
    output tri id_12,
    input wand id_13,
    output supply0 id_14,
    output wand id_15
    , id_31,
    input uwire id_16,
    output uwire id_17,
    input uwire id_18,
    input wor id_19,
    input wor id_20,
    output uwire id_21,
    output uwire id_22
    , id_32,
    input tri id_23,
    input wand id_24,
    input wire id_25,
    input wor id_26,
    input supply0 id_27,
    input supply1 id_28
);
  assign id_31 = id_5;
  assign id_1  = (id_20) ? id_31 : 1;
  wire id_33;
  wire id_34;
  always @(posedge (1'b0) or posedge 1 & id_9)
    case (1)
      id_4: id_2 <= #id_28 id_32;
      default: id_1 = 1;
    endcase
  wire id_35;
  module_0 modCall_1 (
      id_4,
      id_22,
      id_9,
      id_4,
      id_18,
      id_17,
      id_9,
      id_4,
      id_4,
      id_22,
      id_15,
      id_16,
      id_24,
      id_20
  );
  wire id_36;
endmodule

// Seed: 2522393269
program module_0 (
    input uwire id_0,
    input tri0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input supply1 id_5,
    inout supply1 id_6,
    output supply1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10,
    input supply0 id_11,
    input uwire id_12,
    output tri0 id_13,
    input wand id_14,
    input wire id_15,
    input wire id_16,
    input wand id_17,
    input tri1 id_18,
    input tri id_19,
    output uwire id_20,
    input supply1 id_21,
    input supply1 id_22,
    input supply1 id_23,
    output wor id_24
);
  assign id_3 = 1;
  wire id_26, id_27;
endprogram
module module_1 (
    input wor id_0,
    output wor id_1,
    input tri id_2,
    input wand id_3,
    input supply1 id_4,
    output logic id_5,
    input supply0 id_6,
    output tri0 id_7,
    input supply1 id_8,
    output tri id_9,
    input wire id_10,
    input logic id_11,
    input logic id_12,
    input tri1 id_13,
    output tri0 id_14,
    output wor id_15,
    input tri0 id_16,
    input tri0 id_17,
    output wire id_18,
    output uwire id_19,
    output wire id_20,
    output supply1 id_21,
    output logic id_22,
    input tri id_23,
    input tri1 id_24
);
  wire id_26, id_27;
  module_0 modCall_1 (
      id_0,
      id_16,
      id_26,
      id_14,
      id_27,
      id_4,
      id_26,
      id_14,
      id_10,
      id_7,
      id_17,
      id_27,
      id_17,
      id_1,
      id_2,
      id_24,
      id_26,
      id_0,
      id_27,
      id_23,
      id_9,
      id_13,
      id_4,
      id_24,
      id_9
  );
  assign modCall_1.id_9 = 0;
  wor id_28;
  assign id_21 = id_28;
  always @(posedge 1) begin : LABEL_0
    id_9  = 1;
    id_19 = ((id_24));
    id_5 <= id_12;
    id_28 = 1;
    if (1) id_5 = 1'b0;
    id_18 = 1;
    id_26 = id_0;
    id_22 <= id_11;
  end
  wire  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ;
  wire id_45;
endmodule

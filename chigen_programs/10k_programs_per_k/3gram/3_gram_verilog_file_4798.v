// Seed: 3633177437
module module_0 (
    output tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3
);
  wire id_5;
  wire  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  =  id_15  ;
  wire id_45;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output logic id_2,
    input tri0 id_3,
    input wor id_4,
    input wire id_5,
    input wire id_6,
    input wire id_7,
    input supply0 id_8,
    input supply1 id_9,
    output tri0 id_10,
    output wor id_11
);
  always_ff @(negedge id_9)
    if (1 - 1) begin : LABEL_0
      id_2 <= 1;
      $display(1);
    end
  supply0 id_13;
  assign id_13 = 1;
  logic [7:0] id_14;
  nor primCall (id_11, id_3, id_4, id_0, id_8, id_14, id_5, id_6, id_1);
  module_0 modCall_1 (
      id_11,
      id_10,
      id_6,
      id_9
  );
  assign id_10 = 1 && id_1;
  wire id_15;
  assign id_10 = 1'd0;
  assign id_14[1] = id_14;
endmodule

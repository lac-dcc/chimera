// Seed: 4256961628
module module_0 (
    input wor id_0,
    input wor id_1,
    output uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wire id_8,
    output tri id_9,
    output supply1 id_10,
    output supply1 id_11
    , id_19,
    output tri0 id_12,
    output wand id_13,
    input tri id_14,
    output tri0 id_15,
    output wire id_16,
    output wor id_17
);
  always_latch @(*)
    if (1) disable id_20;
    else begin : LABEL_0
      #1;
      id_9 = id_1 - 1;
    end
  assign module_1.type_3 = 0;
  wire  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ;
endmodule
module module_1 (
    output tri1 id_0,
    output wand id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wire id_6,
    output wand id_7,
    output wor id_8,
    output supply0 id_9,
    input wand id_10,
    input uwire id_11
);
  wire id_13, id_14;
  assign id_5 = 1;
  for (id_15 = 1; id_10; id_9 = 1) begin : LABEL_0
    wire id_16;
  end
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_11,
      id_11,
      id_5,
      id_8,
      id_1,
      id_2,
      id_7,
      id_9,
      id_9,
      id_4,
      id_0,
      id_15,
      id_8,
      id_7,
      id_7
  );
  wire id_18;
  wire id_19;
endmodule

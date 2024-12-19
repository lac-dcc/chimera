// Seed: 1886738755
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wand id_4,
    output wire id_5
);
  assign id_4 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    output tri0 id_2,
    input logic id_3,
    input wire id_4,
    output tri0 id_5,
    output tri0 id_6,
    input supply1 id_7,
    output tri1 id_8,
    input tri0 id_9,
    output tri id_10,
    output logic id_11,
    input supply0 id_12,
    input tri id_13,
    input uwire id_14,
    output wire id_15,
    input wor id_16,
    output wand id_17,
    input supply0 id_18,
    output wand id_19,
    output tri id_20,
    output tri1 id_21,
    output supply1 id_22,
    output tri1 id_23,
    input wire id_24
);
  wire id_26;
  final id_1 <= id_3;
  if (id_18) id_27(.id_0(id_13), .id_1(1));
  wire id_28;
  initial begin : LABEL_0
    if (1) @(1 or posedge id_14);
    else begin : LABEL_0
      id_20 = id_18;
    end
  end
  supply1 id_29 = 1, id_30;
  assign id_8 = 1;
  module_0 modCall_1 (
      id_14,
      id_4,
      id_18,
      id_22,
      id_22,
      id_26
  );
  assign modCall_1.id_0 = 0;
  wire id_31;
  assign id_5 = id_14 - id_12;
  always #1 begin : LABEL_0
    id_26 = id_16;
  end
  task id_32(input id_33, input id_34, output id_35);
    begin : LABEL_0
      id_11 = #1 1;
    end
  endtask
endmodule

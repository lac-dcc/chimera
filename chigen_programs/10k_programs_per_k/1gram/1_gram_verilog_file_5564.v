// Seed: 700299627
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    @(posedge id_5 or negedge 1'b0 or id_4)
    if (id_4) id_2 = 1;
    else $display(id_4);
    begin : LABEL_0
      id_4 = 1;
    end
  end
endmodule
module automatic module_1 (
    input wire id_0,
    input wire id_1,
    input tri1 id_2,
    output supply0 id_3,
    input wor id_4,
    output wand id_5,
    input wand id_6,
    output tri0 id_7,
    input wire id_8,
    output tri0 id_9,
    input tri1 id_10,
    output wor id_11,
    input tri0 id_12,
    input uwire id_13,
    input supply1 id_14,
    input tri id_15,
    output tri0 id_16,
    input supply1 id_17,
    output tri0 id_18,
    input uwire id_19
);
  wire id_21;
  assign id_18 = 1;
  wire id_22;
  module_0 modCall_1 (
      id_22,
      id_21,
      id_22,
      id_22,
      id_21,
      id_21
  );
  assign modCall_1.id_6 = 0;
endmodule

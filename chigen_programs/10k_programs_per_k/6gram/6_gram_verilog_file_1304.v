// Seed: 3784933983
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    output wor   id_3,
    input  uwire id_4
);
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output logic id_2,
    output wire  id_3
);
  always @(posedge -1 or negedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= -1'b0;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_1
  );
endmodule
module module_2 #(
    parameter id_11 = 32'd89,
    parameter id_18 = 32'd10
) (
    output supply1 id_0,
    output supply1 id_1,
    input tri id_2,
    input supply1 id_3,
    output uwire id_4,
    output wire id_5,
    output wand id_6,
    output wor id_7,
    input uwire id_8,
    output wor id_9,
    output wor id_10,
    input tri1 _id_11,
    input supply1 id_12,
    input tri0 id_13,
    input tri id_14,
    input tri1 id_15,
    output tri id_16,
    output tri0 id_17,
    output supply0 _id_18,
    input tri id_19,
    input uwire id_20,
    input tri0 id_21,
    input uwire id_22
);
  wire id_24;
  assign id_9 = id_14;
  module_0 modCall_1 (
      id_9,
      id_20,
      id_21,
      id_4,
      id_15
  );
  assign modCall_1.id_3 = 0;
  wire id_25;
  struct packed {
    logic [1  ==  -1 : 1  ==  1] id_26;
    struct packed {
      logic [1 : 1] id_27;
      logic [1 'b0 : 1] id_28;
    } id_29;
  } [id_11  >>>  id_18 : id_18] id_30;
endmodule

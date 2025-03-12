// Seed: 2839289212
module module_0 (
    input wand id_0,
    input tri id_1
    , id_25,
    input wor id_2,
    output tri1 id_3,
    input wor id_4,
    input wand id_5,
    output tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    input tri0 id_9,
    input wand id_10,
    input wand id_11,
    input wire id_12,
    input wor id_13,
    output uwire id_14,
    input tri id_15,
    output supply1 id_16,
    output tri1 id_17,
    input tri0 id_18,
    output supply0 id_19,
    input tri0 id_20,
    input uwire id_21,
    output wand id_22,
    output tri1 id_23
);
  wire id_26;
  ;
  wire id_27;
  logic [1 : 1] id_28;
endmodule
module module_1 (
    output wor   id_0,
    input  tri0  id_1,
    input  wand  id_2,
    output logic id_3
);
  logic [7:0] id_5;
  assign id_5 = id_5[1];
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_23 = 0;
  always @(posedge id_1 + -1, posedge id_5) begin : LABEL_0
    if (1) begin : LABEL_1
      id_3 = id_1;
    end else begin : LABEL_2
      #1;
      assign id_3 = 1'h0 < id_2;
    end
  end
endmodule

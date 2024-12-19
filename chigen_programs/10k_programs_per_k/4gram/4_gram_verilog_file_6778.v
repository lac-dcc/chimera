// Seed: 1551733660
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2
);
  logic [7:0] id_4;
  logic [7:0] id_5 = id_4;
  assign id_4[1] = id_5;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    output tri id_4
);
  reg id_6, id_7 = 1'b0;
  initial begin : LABEL_0$display
    ;
  end
  wire id_8;
  assign id_7 = 1;
  wire id_9;
  always_comb @(id_1) begin : LABEL_0
    id_6 = 1;
    #1;
    id_7 <= 1 & 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  always_ff @(id_9 or id_0) id_4 = 1;
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
endmodule

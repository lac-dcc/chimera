// Seed: 1467170970
module module_0 (
    output tri id_0,
    input uwire id_1,
    output uwire id_2,
    output wand id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wor id_8,
    output wor id_9,
    input uwire id_10,
    output uwire id_11,
    output uwire id_12,
    input supply0 id_13,
    input tri id_14,
    output tri id_15,
    input supply1 id_16,
    input wire id_17,
    input wand id_18,
    output supply1 id_19,
    input supply0 id_20,
    input supply1 id_21,
    output tri id_22,
    input wor id_23,
    input tri1 id_24,
    output tri id_25,
    input wand id_26
    , id_30, id_31,
    input supply1 id_27,
    input wand id_28
);
  generate
    always @(posedge id_30 or posedge 1) begin : LABEL_0
      id_15 = id_4;
    end
  endgenerate
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5,
    output wor id_6,
    input wire id_7,
    input supply0 id_8,
    input wor id_9,
    output tri0 id_10,
    input tri1 id_11
);
  id_13 :
  assert property (@(posedge 1) 1)
  else $display;
  tri0 id_14;
  supply1 id_15;
  assign id_3  = id_15++ >= 1;
  assign id_14 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_9,
      id_2,
      id_7,
      id_5,
      id_1,
      id_10,
      id_9,
      id_10,
      id_10,
      id_8,
      id_8,
      id_3,
      id_0,
      id_0,
      id_9,
      id_10,
      id_9,
      id_2,
      id_10,
      id_2,
      id_8,
      id_6,
      id_9,
      id_5,
      id_5
  );
  wire id_16;
  always @(posedge 1, 1 == id_7) id_15 = id_14;
  wire id_17;
  assign id_4 = 1 & id_0;
  tri0 id_18 = id_0;
  assign id_3 = id_7;
  always @(*) $display(1, 1);
endmodule

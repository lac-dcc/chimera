// Seed: 381300382
module module_0;
  reg id_1, id_2, id_3;
  assign module_1.id_12 = 0;
  always @(posedge id_3) begin : LABEL_0
    id_3 = id_2 << id_1;
  end
endmodule
module module_1 #(
    parameter id_20 = 32'd4
) (
    output tri0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wand id_3,
    output supply1 id_4,
    output wire id_5,
    input supply1 id_6,
    output wor id_7,
    input tri1 id_8,
    input tri id_9,
    input tri id_10,
    input wire id_11,
    output supply0 id_12,
    input tri id_13,
    input wor id_14,
    input wand id_15,
    input tri0 id_16,
    output tri0 id_17,
    output tri id_18,
    input supply1 id_19,
    input supply1 _id_20,
    output tri0 id_21,
    input wand id_22,
    output tri1 id_23,
    output wor id_24
);
  logic [-1 'd0 : id_20] id_26;
  xnor primCall (
      id_0, id_1, id_10, id_11, id_13, id_14, id_15, id_16, id_19, id_22, id_26, id_6, id_8, id_9
  );
  module_0 modCall_1 ();
  wire id_27;
  assign id_17 = id_9 - id_16;
endmodule

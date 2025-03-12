// Seed: 3233847536
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    output tri1 id_10,
    input wire id_11,
    output tri0 id_12,
    input tri id_13,
    input tri0 id_14,
    output wand id_15,
    input wor id_16,
    input wire id_17,
    input uwire id_18,
    input uwire id_19,
    input tri0 id_20,
    input wor id_21,
    output tri1 id_22,
    input uwire id_23,
    output uwire id_24,
    output tri id_25
);
  wand id_27 = (id_11) == 1;
  wire id_28 = -1;
  assign module_1.id_0 = 0;
  assign id_10 = ~id_20 & id_17 == id_21;
  uwire id_29 = -1 < -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd97,
    parameter id_3 = 32'd49
) (
    input tri id_0,
    input supply0 id_1,
    output wor _id_2,
    input tri0 _id_3,
    output tri id_4,
    output supply1 id_5
);
  logic [id_3  !=  id_2 : -1] id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_5,
      id_0,
      id_1,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4,
      id_1,
      id_5,
      id_0,
      id_0,
      id_4,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4,
      id_0,
      id_5,
      id_4
  );
  always @(posedge id_1) begin : LABEL_0
    id_7 <= -1'b0;
  end
endmodule

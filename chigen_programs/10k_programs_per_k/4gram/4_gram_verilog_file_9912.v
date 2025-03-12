// Seed: 658659893
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    input wand module_0,
    output uwire id_4,
    input wand id_5,
    input wand id_6,
    output wire id_7,
    input tri0 id_8,
    input wand id_9,
    input uwire id_10,
    input uwire id_11,
    input wor id_12,
    output tri id_13,
    output wor id_14,
    input supply0 id_15,
    input tri id_16
);
endmodule
module module_1 #(
    parameter id_12 = 32'd17,
    parameter id_6  = 32'd36
) (
    input supply0 id_0,
    output tri0 id_1,
    input wire id_2,
    output tri0 id_3,
    input uwire id_4,
    input wor id_5,
    input supply1 _id_6,
    output logic id_7,
    output logic id_8,
    output wor id_9,
    input tri1 id_10,
    input tri1 id_11,
    input supply0 _id_12,
    input tri1 id_13
);
  initial begin : LABEL_0
    id_8 <= id_12 > id_11;
  end
  logic [-1 : id_12  +  1 'b0 +  id_6  -  id_12] id_15;
  always_comb @(posedge id_2 == -1) if ({1{1}}) id_7 <= id_11;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_5,
      id_4,
      id_1,
      id_13,
      id_10,
      id_9,
      id_10,
      id_4,
      id_4,
      id_0,
      id_5,
      id_9,
      id_3,
      id_13,
      id_11
  );
  assign modCall_1.id_14 = 0;
  logic [-1 : (  -1 'b0 )] id_16;
  assign id_1 = -1 == 1;
  assign id_7 = -1;
endmodule

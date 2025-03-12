// Seed: 1995650656
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    input uwire id_6,
    input wire id_7,
    output tri id_8
);
  always @(negedge id_1 or posedge id_7 == id_6) release id_8;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd26
) (
    output wor id_0,
    output tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    input wor id_8,
    output wor id_9,
    output logic id_10,
    input wire id_11,
    input tri1 _id_12,
    output tri1 id_13,
    input tri id_14,
    output tri0 id_15,
    input wand id_16,
    input wand id_17,
    output supply0 id_18,
    output wor id_19
);
  module_0 modCall_1 (
      id_4,
      id_14,
      id_13,
      id_5,
      id_3,
      id_3,
      id_4,
      id_11,
      id_9
  );
  assign id_19 = id_12;
  logic [id_12 : 1  < ""] id_21;
  always @(posedge -1'b0) begin : LABEL_0
    id_10 = 1;
  end
endmodule

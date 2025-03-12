// Seed: 872278027
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri1 id_2,
    output tri1 id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wor id_6,
    input wor id_7,
    output wire id_8
);
  assign id_5 = -1;
  assign id_2 = id_6 ? 1 : -1 == id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd46
) (
    input wor id_0,
    input tri id_1,
    output supply0 id_2,
    output wor _id_3,
    input wand id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply0 id_8,
    output logic id_9,
    input supply0 id_10,
    input supply1 id_11
);
  always @(posedge id_5) begin : LABEL_0
    id_9 <= -1;
  end
  logic [id_3 : 1  +  -1] id_13;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_7,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule

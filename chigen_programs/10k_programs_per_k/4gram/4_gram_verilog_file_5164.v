// Seed: 3701401294
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output logic id_2,
    input wor id_3,
    output wand id_4,
    input supply1 id_5,
    input wire id_6,
    output tri1 id_7,
    input wire id_8,
    input uwire id_9,
    output wand id_10,
    input tri1 id_11
);
  always @(posedge id_8 or negedge id_8) begin : LABEL_0
    id_2 <= id_1;
    disable id_13;
  end
  assign module_1.id_0 = 0;
  logic id_14;
endmodule
module module_1 #(
    parameter id_3 = 32'd50
) (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2,
    input tri1 _id_3,
    output logic id_4
);
  logic [id_3 : -1] id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1
  );
  initial begin : LABEL_0
    id_4 <= -1;
  end
endmodule

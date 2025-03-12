// Seed: 1980990172
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input uwire id_2,
    output logic id_3,
    output supply0 id_4,
    input supply0 id_5,
    output wire id_6,
    input tri1 id_7,
    input supply1 id_8
);
  initial begin : LABEL_0
    id_3 = id_1;
  end
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd78,
    parameter id_3 = 32'd12,
    parameter id_8 = 32'd50
) (
    input wor _id_0,
    output wor id_1,
    input tri0 id_2,
    input supply0 _id_3,
    output wire id_4,
    output tri id_5,
    output logic id_6
);
  always @(id_3) begin : LABEL_0
    id_6 <= 1;
  end
  logic _id_8;
  wire id_9;
  wire [id_3 : id_0  &&  id_8] id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_6,
      id_4,
      id_2,
      id_5,
      id_2,
      id_2
  );
  wand id_11 = 1;
endmodule

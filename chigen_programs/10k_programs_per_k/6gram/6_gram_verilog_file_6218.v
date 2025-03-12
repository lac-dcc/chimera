// Seed: 1180106156
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    output tri1 id_6
);
  always @("") force id_5 = -1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd4,
    parameter id_7 = 32'd13
) (
    output wor id_0,
    output tri0 id_1,
    output logic id_2,
    input supply0 id_3,
    output wor id_4,
    input supply0 id_5,
    output wand _id_6,
    input wand _id_7,
    input tri0 id_8
);
  logic [1 : id_6  <  id_7] id_10;
  assign id_10 = id_10;
  wire id_11;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_3,
      id_8,
      id_3,
      id_1,
      id_4
  );
  assign id_0 = 1;
  always @(*) begin : LABEL_0
    id_2 <= {id_7{1 & id_10}};
  end
endmodule

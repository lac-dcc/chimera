// Seed: 370250025
module module_0 (
    input tri0 id_0,
    output logic id_1,
    output supply0 id_2,
    input tri1 module_0,
    input wire id_4,
    input wand id_5,
    output supply1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    input tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    input wire id_12
);
  always begin : LABEL_0
    id_1 <= -1;
  end
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd37,
    parameter id_3 = 32'd98
) (
    inout  logic id_0,
    output tri0  id_1,
    input  tri1  _id_2,
    input  tri0  _id_3,
    input  tri0  id_4
);
  logic [7:0] id_6;
  parameter id_7 = 1;
  always begin : LABEL_0
    id_0 = new[-1];
    wait (-1);
  end
  module_0 modCall_1 (
      id_4,
      id_0,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
  wire [id_3 : id_2] id_8;
  assign id_6[id_3] = 1;
  assign id_1 = 1 - !id_4;
  wire id_9;
endmodule

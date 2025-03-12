// Seed: 2835088105
module module_0 (
    input tri0 id_0,
    output logic id_1,
    output wand id_2,
    output wor id_3,
    input supply1 id_4,
    input supply1 id_5
);
  logic id_7;
  assign id_1 = 1;
  real  id_8;
  logic id_9;
  localparam integer id_10 = 1;
  assign id_7 = -1'b0;
  initial id_1 = 1'b0;
endmodule
module module_1 #(
    parameter id_4 = 32'd99
) (
    input  tri1  id_0,
    input  wire  id_1,
    output logic id_2,
    output wor   id_3 [-1 : id_4],
    output tri1  _id_4,
    output tri0  id_5
);
  id_7 :
  assert property (@(posedge id_7) id_7) id_2 <= 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_5 = 0;
  tri id_8 = -1;
endmodule

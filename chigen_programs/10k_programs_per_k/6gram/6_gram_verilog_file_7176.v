// Seed: 3994671334
module module_0 (
    input uwire id_0,
    output wor id_1,
    input uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    input tri id_5,
    output tri id_6,
    input wor id_7,
    output uwire id_8,
    output uwire id_9
);
  tri id_11;
  assign id_11 = {id_4{1 == ~id_7}};
  assign id_1  = 1;
  wand id_12 = 1;
  assign id_12 = id_0;
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    output logic id_2,
    input  logic id_3,
    input  tri1  id_4,
    input  logic id_5,
    input  wor   id_6,
    output tri   id_7
);
  always @(posedge id_5 or posedge id_3) begin : LABEL_0
    if (id_4) id_2 <= id_5;
  end
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6,
      id_7,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule

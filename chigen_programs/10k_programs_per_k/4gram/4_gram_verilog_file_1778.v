// Seed: 805120214
module module_0 (
    input supply0 id_0,
    output uwire id_1
    , id_7,
    input tri id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5
);
  wire id_8;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    output logic id_4,
    input tri id_5,
    output wand id_6,
    input wand id_7,
    output supply0 id_8,
    output tri1 id_9,
    input tri id_10
);
  assign id_8 = {id_1, -1} ? id_1 : -1;
  logic [-1 'b0 : -1] id_12;
  initial begin : LABEL_0
    id_4 <= id_5;
  end
  xnor primCall (id_4, id_2, id_10, id_3, id_1, id_0);
  module_0 modCall_1 (
      id_10,
      id_6,
      id_2,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule

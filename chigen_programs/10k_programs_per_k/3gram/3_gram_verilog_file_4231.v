// Seed: 599689296
module module_0 (
    output tri id_0,
    input supply1 id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5,
    output wor id_6,
    input tri id_7,
    output tri1 id_8,
    input tri id_9,
    input wire id_10,
    input tri1 id_11,
    output uwire id_12
    , id_14
);
  assign id_2 = -1;
  if (1) begin : LABEL_0
    assign id_2 = -1;
  end else assign id_14[-1] = 1 == id_3;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input tri id_2,
    output supply0 id_3,
    output logic id_4
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_8 = 0;
  always @({1{-1}}) begin : LABEL_0
    if (-1'b0) id_4 = #id_6 1;
    id_4 = id_2;
  end
endmodule

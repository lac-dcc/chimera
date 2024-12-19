// Seed: 744434235
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output wor id_4,
    output tri0 id_5
);
  always disable id_7;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input uwire id_2,
    input wor id_3
    , id_12,
    input uwire id_4,
    input wire id_5,
    output logic id_6,
    input wor id_7,
    output supply1 id_8,
    input uwire id_9,
    output tri1 id_10
);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_9,
      id_8,
      id_0,
      id_10
  );
  assign modCall_1.type_1 = 0;
  initial begin : LABEL_0
    if (id_5) begin : LABEL_0
      id_6 <= 1'b0;
      id_10 = 1;
    end else id_12 <= 1;
  end
endmodule

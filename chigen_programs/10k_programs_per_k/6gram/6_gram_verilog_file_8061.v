// Seed: 1037941083
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wire id_2,
    output tri0 id_3,
    output supply0 id_4
    , id_7,
    output wor id_5
);
  always @(*) begin : LABEL_0
    id_7 <= 1;
    deassign id_3;
    assume (id_1 || 1'h0);
  end
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    output tri id_3,
    input tri id_4,
    input supply1 id_5
    , id_9,
    input wire id_6,
    input wire id_7
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule

// Seed: 2710186633
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input wor  id_2,
    input wire id_3,
    input tri0 id_4,
    input wire id_5
);
  assign id_7 = id_0 ? id_1 : id_2 - 1'd0 ? id_4 : 1'h0 - 1'd0;
  assign id_7 = id_2 == 1;
  supply0 id_8;
  generate
    for (id_9 = 1; 1; id_8 = 1) begin : LABEL_0
      assign id_8 = 1 ? id_5 : id_7 - id_2 ? (id_4 ^ 1) : id_4;
    end
  endgenerate
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    output tri id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5
    , id_8,
    output wor id_6
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule

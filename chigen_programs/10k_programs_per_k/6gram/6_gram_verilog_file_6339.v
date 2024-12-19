// Seed: 1756363834
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    output uwire id_3
);
  wire  id_5;
  uwire id_6 = 1;
  wire  id_7;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    output wor id_2,
    output supply1 id_3,
    input wor id_4,
    inout uwire id_5,
    output wor id_6,
    input tri id_7
);
  wor id_9 = id_0 == id_4;
  always @(1'b0) begin : LABEL_0
    case (1)
      id_9: id_9 = 1'b0;
      id_5: ;
    endcase
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_9
  );
  assign modCall_1.type_10 = 0;
endmodule

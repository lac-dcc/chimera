// Seed: 62288305
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    input  uwire id_2
);
  assign id_0 = id_1;
  assign module_1.id_2 = 0;
  generate
    wire id_4;
    ;
  endgenerate
endmodule
module module_1 #(
    parameter id_6 = 32'd8
) (
    output supply0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output logic id_3,
    input uwire id_4,
    output wor id_5,
    inout wor _id_6
);
  logic [-1 : id_6] id_8 = id_2;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4
  );
  always_comb @(posedge {1, id_1} + id_8[id_6] or posedge id_8) begin : LABEL_0
    if (1 ? -1 : 1) id_3 <= id_1;
    return id_1;
  end
endmodule

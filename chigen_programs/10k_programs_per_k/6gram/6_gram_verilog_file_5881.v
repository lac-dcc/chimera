// Seed: 1112243264
module module_0 (
    input  uwire id_0,
    output wor   id_1,
    output wor   id_2
);
  id_4(
      .id_0(id_0), .id_1(id_1 - id_2), .id_2(id_1), .id_3(id_2)
  );
  assign id_2 = 1;
  assign id_1 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output uwire id_2
);
  always @(posedge id_0 or id_0 != 1'd0) id_2 = 1;
  reg id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  supply1 id_5 = 1;
  reg id_6;
  always @(posedge id_5) begin : LABEL_0
    if (1) id_6 <= id_4;
  end
endmodule

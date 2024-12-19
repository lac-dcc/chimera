// Seed: 1658967817
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input supply1 id_6
);
  module_2 modCall_1 (
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = |id_4 ? 1 : 1;
  tri1 id_8;
  assign id_8 = id_3;
  wire id_9;
endmodule
module module_1 (
    input  wor  id_0,
    output tri0 id_1
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
  assign id_1 = 1'b0;
  wire id_3;
  assign id_1 = id_0;
endmodule
module module_2 (
    input wor  id_0,
    input wire id_1,
    input tri0 id_2
);
  always @(1 or negedge 1) begin : LABEL_0
    id_4[""] <= 1;
  end
  always @(posedge id_1) begin : LABEL_0
    id_5 = id_2;
  end
endmodule

// Seed: 1549548158
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    #1 id_2 = 1'b0;
  end
  module_2 modCall_1 (id_2);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_3) id_1 <= id_5;
  xor primCall (id_4, id_3, id_1, id_5, id_2);
  module_0 modCall_1 (
      id_4,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  tri id_2, id_3, id_4, id_5, id_6, id_7;
  assign id_4 = 1'd0 - id_6;
endmodule

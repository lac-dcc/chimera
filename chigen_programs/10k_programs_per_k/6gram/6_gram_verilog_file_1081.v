// Seed: 3712160394
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  uwire id_3 = 1;
  assign module_1.type_4 = 0;
  logic [7:0] id_4;
  assign id_4[1] = ~id_3;
  assign id_1 = ~{1'b0 | 1'b0{1}};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_1 or 1) begin : LABEL_0
    id_3 <= id_1;
    if (id_2) id_2 = id_3;
  end
  supply1 id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule

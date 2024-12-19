// Seed: 3012151192
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  tri id_6 = 1, id_7;
  wire id_8, id_9;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always_comb @(posedge 1 or posedge id_5) begin : LABEL_0
    id_3 <= 1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
endmodule

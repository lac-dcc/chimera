// Seed: 3916570833
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
endmodule
module module_1;
  always_comb @(posedge id_1 or posedge id_1) begin : LABEL_0
    id_1 <= 1;
  end
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5 :
  assert property (@(posedge id_2) id_4)
  else $display(1 == (1'b0 == 1), id_5, 1);
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule

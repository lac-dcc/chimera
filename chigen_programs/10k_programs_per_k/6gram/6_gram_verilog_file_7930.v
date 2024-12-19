// Seed: 480880334
module module_0;
  initial $display(id_1[1]);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_1) begin : LABEL_0
    for (id_3 = id_1; id_1; id_1 = id_1) begin : LABEL_0
      assign id_2 = (id_1);
      id_2 <= id_1 == 1 && {id_1, 1'b0, id_1, 1, id_1 - 1, 1 != id_1, id_1, (1'b0 ? 1'b0 : 1), 1};
    end
  end
  module_0 modCall_1 ();
endmodule

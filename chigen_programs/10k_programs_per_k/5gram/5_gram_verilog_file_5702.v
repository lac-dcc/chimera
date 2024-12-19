// Seed: 1015851960
module module_0;
  always_comb begin : LABEL_0
    id_1 <= 1;
    fork
      id_1 <= {1{1'd0}} && id_1 === id_1;
      begin : LABEL_0
        begin : LABEL_0
          id_1 <= 1;
        end
        if (1) begin : LABEL_0
          deassign id_1;
        end
      end
    join_any
    id_1 <= 1'b0;
    id_1 <= id_1;
    id_1 <= id_1;
    $display(id_1 == id_1, id_1, id_1);
    if (1) id_1 = 1 == "";
  end
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2,
    input wand id_3
);
  module_0 modCall_1 ();
endmodule

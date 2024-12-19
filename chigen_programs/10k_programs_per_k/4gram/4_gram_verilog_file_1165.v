// Seed: 1308219874
module module_0;
  wire id_1;
  assign module_1.id_3 = 0;
  if (1'b0) begin : LABEL_0
    always begin : LABEL_0
      if (1) begin : LABEL_0
        deassign id_1;
      end
    end
    assign id_1 = 1;
  end else begin : LABEL_0
    assign id_1 = id_1 - 1;
    assign id_1 = id_1;
  end
  wire id_2;
  integer id_4, id_5, id_6;
endmodule
module module_1 (
    input  supply0 id_0
    , id_3,
    output supply0 id_1
);
  initial begin : LABEL_0
    fork
      id_3 <= 1'b0;
    join_any
  end
  assign id_3 = 1;
  module_0 modCall_1 ();
  supply1 id_4 = id_3 ^ 1;
endmodule

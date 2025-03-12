// Seed: 3526324229
module module_0;
  reg id_1;
  reg id_2;
  initial begin : LABEL_0
    if (1) id_1 <= #1 1'd0;
    else begin : LABEL_1
      $signed(49);
      ;
      id_1 <= id_2;
      if (1) begin : LABEL_2
        id_1 = id_1;
      end else begin : LABEL_3
        id_2 <= -1'h0;
      end
    end
  end
  parameter id_3 = -1;
  assign module_1.id_1 = 0;
  assign id_2 = 1;
  assign id_1 = -1;
endmodule
module module_1 ();
  wire [-1 : (  (  1  )  )] id_1 = -1 | -1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
endmodule

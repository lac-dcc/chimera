// Seed: 3957356082
module module_0;
  always id_1 <= 1;
  assign module_1.id_6 = 0;
endmodule
module module_1;
  reg id_2 = 1'b0;
  assign id_1 = id_2;
  wire id_3;
  wire id_4;
  module_0 modCall_1 ();
  wire id_5;
  reg id_6, id_7, id_8, id_9;
  logic [7:0] id_10;
  always @(id_10[1]) id_9 <= id_1;
  wire id_11;
endmodule
module module_2 (
    output logic id_0
);
  supply1 id_2;
  always begin : LABEL_0
    if (id_2)
      if (id_2) begin : LABEL_0
        id_2 = 1'd0;
      end
  end
  wire id_3, id_4;
  xnor primCall (id_0, id_2, id_3, id_4);
  assign id_4 = id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial id_0 <= 1;
endmodule

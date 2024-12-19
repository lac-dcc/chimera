// Seed: 1193115555
module module_0;
  tri0 id_2;
  always disable id_3;
  always @(negedge 1) begin : LABEL_0
    if (1)
      for (id_3 = 1; id_3; id_2 = 1) begin : LABEL_0
        disable id_4;
        id_1 <= 1 == 1 ? 1 : 1;
      end
    else begin : LABEL_0
      return id_1;
    end
  end
  initial id_1 = #id_6 1;
  reg id_7 = id_6;
  reg id_8 = id_1#(.id_6(""));
endmodule
module module_1;
  assign id_1[1] = 1;
  wor id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  id_4(
      id_3, 1'b0, id_3
  ); id_5 :
  assert property (@(negedge 1) id_1[1 : 1])
  else $display(1, 1);
endmodule

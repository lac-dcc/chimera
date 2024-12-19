// Seed: 3479497400
module module_0 ();
  reg id_2;
  assign id_2 = id_1;
  reg id_3;
  always @(negedge id_2)
    if (id_2) begin : LABEL_0
      if (1) id_3 <= id_3;
      else $display(1);
    end
  assign id_1 = id_3;
  initial $display;
  always @(1 or id_2 or posedge 1) begin : LABEL_0
    assume (id_1 + id_2);
    wait (id_1);
    if (0) id_3 <= id_1;
    else begin : LABEL_0
      if (1) id_1 <= id_3 == id_3;
    end
  end
endmodule
module module_1 (
    input logic id_0,
    input wand  id_1
);
  always @(posedge 1) id_3 <= id_0;
  module_0 modCall_1 ();
  assign modCall_1.type_5 = 0;
endmodule

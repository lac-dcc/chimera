// Seed: 4176376807
module module_0 ();
  always @(1 or posedge id_1[""]) $display(1'd0);
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_4  = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1;
  logic [7:0] id_5;
  wand id_6 = 1;
  assign id_5[1] = 1 ? id_4 : id_4;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  always @(*) begin : LABEL_0
    id_1 <= 1'b0;
  end
endmodule

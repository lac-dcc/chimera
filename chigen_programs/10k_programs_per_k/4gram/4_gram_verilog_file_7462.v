// Seed: 3591394163
module module_0 ();
  wire id_1;
  reg  id_2;
  reg  id_3;
  reg  id_4;
  always @(posedge id_4) begin
    $display(1);
    id_2 = 1'b0;
    id_2 <= id_3;
    $display;
    id_4 <= 1;
  end
  assign id_4 = id_2;
  initial assume (1);
  assign id_2 = 1;
endmodule
module module_1;
  assign id_1[(1'd0)] = 1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1[1'h0] = 1'h0 & id_2;
  module_0();
endmodule

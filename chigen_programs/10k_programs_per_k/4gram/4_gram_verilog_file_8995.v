// Seed: 3724126902
module module_0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  wand id_4;
  final begin
    id_1[1'b0 : 1] = id_2;
  end
  module_0(); id_5 :
  assert property (@(posedge id_4) 1)
  else $display;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2#(("")) [1] = 1 ? id_1[1'h0 : 1] : 1;
  module_0();
endmodule

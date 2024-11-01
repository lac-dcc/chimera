// Seed: 3273096708
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4;
  module_0();
endmodule
module module_3 ();
  always force id_1 = id_1;
  module_0();
  for (id_2 = 1 / 1; 1'h0; id_1++) begin : id_3
    assign id_1 = id_2;
    assign id_1 = 1;
  end
  assign id_2 = 1;
  id_4 :
  assert property (@(posedge id_2 > 1'd0) id_4)
  else $display;
endmodule

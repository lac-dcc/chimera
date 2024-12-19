// Seed: 138003539
module module_0 ();
  assign module_1.id_2 = 0;
  always @(id_1 == "") begin : LABEL_0
    id_1 = 1'd0;
    disable id_2;
    assert (1);
    $display;
  end
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri id_3
    , id_5
);
  wire id_7;
  nor primCall (id_1, id_2, id_3, id_5, id_7);
  module_0 modCall_1 ();
endmodule
module module_2;
  uwire id_2;
  assign id_1 = 1;
  generate
    assign id_2 = id_1;
  endgenerate
  always @(negedge (1)) id_1 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule

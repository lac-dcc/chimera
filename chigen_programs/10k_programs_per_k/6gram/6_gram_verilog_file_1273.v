// Seed: 1814499711
module module_0;
  always @(1 or id_1 or id_1(id_1)) release id_1;
  module_2 modCall_1 ();
  reg id_2, id_3;
  reg id_4;
  always
    if (id_2) assign id_2 = id_1;
    else begin : LABEL_0
      id_4 <= id_2;
    end
endmodule
module module_1;
  always @(1) id_1 = #1 1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
  supply1 id_1;
  assign module_0.id_2 = 0;
  assign id_1 = 1;
endmodule
module module_3 (
    id_1
);
  input wire id_1;
  initial begin : LABEL_0
    assert (id_1);
    $display(1 === 1'b0);
  end
  module_2 modCall_1 ();
endmodule

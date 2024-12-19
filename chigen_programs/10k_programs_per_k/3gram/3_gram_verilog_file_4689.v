// Seed: 707116838
module module_0;
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  not primCall (id_2, id_3);
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire id_4;
  assign id_4 = 1'h0;
  module_0 modCall_1 ();
  always
    if (1) begin : LABEL_0
      id_2 = 1 - id_3 * id_2;
    end else begin : LABEL_0
      id_5(1 - id_3(id_2 - id_5, 1, id_3, 1'b0, id_5, 1, id_2, 1));
    end
  assign id_2 = 1'b0;
  or primCall (id_1, id_2, id_3, id_4);
  specify
    $width(id_6, 1);
    $width(id_7, id_2);
  endspecify
endmodule

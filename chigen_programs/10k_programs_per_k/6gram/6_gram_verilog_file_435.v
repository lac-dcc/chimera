// Seed: 32500663
module module_0;
  wire id_1;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  logic id_3;
  initial begin : LABEL_0
    if (id_0) begin : LABEL_0
      id_1 = id_3;
      id_3 <= id_3;
      id_1 <= id_3;
      $display(1 < id_0, 1 ^ ~id_3, id_0, 1, id_3, 1 == 1);
      id_1 <= id_3;
    end else if (1 < 1) #1;
    else id_1 <= id_0;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri1 id_0,
    output tri0 id_1,
    output wire id_2
);
  assign id_0 = 1'b0;
  module_0 modCall_1 ();
endmodule

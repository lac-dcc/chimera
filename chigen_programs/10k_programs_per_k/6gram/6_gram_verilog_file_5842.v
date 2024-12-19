// Seed: 1502027456
module module_0;
  reg id_2;
  initial begin : LABEL_0
    #id_3;
    $display(id_3, 1);
    id_2 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1'b0;
  assign id_5 = id_2;
  assign id_5 = 1'h0;
  wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  initial begin : LABEL_0
    id_4 <= 1;
    id_5 <= id_2;
    wait (1);
  end
endmodule

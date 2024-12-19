// Seed: 2404757584
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 ();
  assign id_1[1] = id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_3 or posedge id_7) begin : LABEL_0
    if (id_7 != id_3) if (1) id_1 = 1;
    if (1 && id_2) begin : LABEL_0
      id_2 <= 1'b0;
      $display(1'h0, 1'b0);
      id_3 <= 1;
    end
  end
  module_0 modCall_1 ();
endmodule

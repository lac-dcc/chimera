// Seed: 1605008586
module module_0;
  assign id_1 = (id_1.id_1);
  wire id_2;
  assign module_2.id_5 = 0;
  supply1 id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_2 <= id_4;
    id_3 = 1'b0;
  end
  reg id_5;
  module_0 modCall_1 ();
  always_ff @(posedge id_4)
    if (1) begin : LABEL_0
      if (1'b0) disable id_6;
      else id_5 <= 1;
    end
endmodule

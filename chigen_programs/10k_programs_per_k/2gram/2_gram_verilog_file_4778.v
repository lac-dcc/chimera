// Seed: 1765354186
module module_0;
  assign id_1 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 ();
  assign id_1 = id_4;
  assign id_3 = id_7;
endmodule
module module_2;
  always
    if (1) begin : LABEL_0
      wait (id_1);
      id_1[1] <= (1);
    end
  always_latch begin : LABEL_0
    id_2 = 1'b0;
    id_2 <= 1 != id_2;
  end
  always_comb begin : LABEL_0
    id_3 <= id_3;
  end
  assign id_4 = 1;
  wire id_5;
  module_0 modCall_1 ();
endmodule

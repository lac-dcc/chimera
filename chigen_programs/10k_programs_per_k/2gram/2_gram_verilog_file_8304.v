// Seed: 1330461193
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  logic [7:0] id_5;
  assign id_5[1'b0] = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4
  );
  wire id_6;
  always_latch begin : LABEL_0
    begin : LABEL_0
      id_1 <= id_5;
    end
  end
endmodule

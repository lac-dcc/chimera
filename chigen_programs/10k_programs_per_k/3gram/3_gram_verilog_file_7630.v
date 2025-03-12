// Seed: 4093694553
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_5;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd73
) (
    id_1,
    _id_2,
    id_3
);
  output reg id_3;
  output wire _id_2;
  output wire id_1;
  wire id_4;
  bit  id_5;
  wire id_6;
  always_ff @(posedge id_5 or id_6) begin : LABEL_0
    id_5 <= 1'b0;
  end
  module_0 modCall_1 (
      id_1,
      id_4,
      id_6,
      id_6
  );
  always #1 begin : LABEL_1
    id_3 <= -1 - id_4;
  end
  logic [-1 : id_2] id_7 = id_4;
endmodule

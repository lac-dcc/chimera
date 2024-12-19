// Seed: 2631909747
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0,
    id_4
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1'd0;
  always @(posedge id_3 == id_2) begin : LABEL_0
    disable id_6;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  supply0 id_6 = 1;
  wire id_7, id_8;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_6
  );
  assign modCall_1.id_4 = 0;
  reg   id_10 = 1;
  wire  id_11;
  wire  id_12;
  uwire id_13 = 1'h0;
  always @(posedge id_11) begin : LABEL_0
    id_10 <= id_2;
  end
endmodule

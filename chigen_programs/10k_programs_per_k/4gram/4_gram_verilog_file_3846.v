// Seed: 1722797562
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output uwire id_5;
  output wire id_4;
  assign module_1.id_7 = 0;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output reg id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_1,
      id_3,
      id_4
  );
  output wire id_1;
  always @(posedge 1'b0) begin : LABEL_0
    id_7 <= id_2;
  end
endmodule

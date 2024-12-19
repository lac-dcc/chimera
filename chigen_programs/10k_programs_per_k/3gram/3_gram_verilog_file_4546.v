// Seed: 3828879332
module module_0;
  assign id_1 = 1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1;
  logic [7:0] id_1;
  logic [7:0] id_2;
  always @(*);
  wire id_3;
  always_ff @(posedge id_1[1]) begin : LABEL_0
    id_1[1'b0] <= 1;
    id_1 = id_2;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
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
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
endmodule

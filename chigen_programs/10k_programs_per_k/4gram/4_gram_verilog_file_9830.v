// Seed: 617943070
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign {id_3, id_1} = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_2;
  wire id_9;
  wire id_10;
  always @(id_2) begin : LABEL_0
    id_4 = id_8 ^ 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5
  );
  assign id_6 = 1;
endmodule

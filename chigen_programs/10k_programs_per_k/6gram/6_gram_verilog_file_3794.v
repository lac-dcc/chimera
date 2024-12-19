// Seed: 2517665392
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6
  );
  assign modCall_1.id_3 = 0;
  always @(posedge id_6, 1) begin : LABEL_0
    wait (1);
  end
  always id_8 <= #1 1 - 1;
endmodule

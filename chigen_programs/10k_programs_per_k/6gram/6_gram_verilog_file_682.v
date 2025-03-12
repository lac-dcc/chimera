// Seed: 1240110454
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always force id_1 = id_1 == 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 (
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
  inout reg id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output reg id_7;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_12,
      id_1
  );
  inout wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7 = 1'b0 ? id_1 : id_5;
  assign id_7 = id_4[1'b0];
  always @(posedge 1 or negedge id_12) begin : LABEL_0
    fork
      id_15;
    join
    id_11 <= id_6;
    $signed(5);
    ;
    id_7 <= id_11;
  end
endmodule

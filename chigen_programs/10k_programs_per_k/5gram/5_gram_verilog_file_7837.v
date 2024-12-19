// Seed: 112899944
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always #1 id_2 = 1'b0;
  assign id_2 = 1'b0;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_12;
  assign id_1 = id_12;
  module_0 modCall_1 (
      id_11,
      id_12,
      id_8
  );
  always @(1'd0 > id_5 or 1) begin : LABEL_0
    if (1) begin : LABEL_0
      wait (id_12);
    end else id_5 <= 1;
  end
  wire id_13;
endmodule

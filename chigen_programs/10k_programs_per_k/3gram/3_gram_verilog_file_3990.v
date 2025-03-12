// Seed: 1791205227
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  wire id_8;
  always @(-1 or id_3) begin : LABEL_0
    $clog2(88);
    ;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout reg id_2;
  input wire id_1;
  assign id_3 = id_2;
  assign id_2 = 1 - id_3;
  logic [-1 'h0 : 1 'b0] id_5;
  ;
  localparam id_6 = 1;
  wire id_7;
  always_ff @(-1 or 1) begin : LABEL_0
    id_2 <= -1;
  end
  defparam id_6.id_6 = id_6 * id_6 + 1'b0 + 1 + id_6 + 1;
  xor primCall (id_2, id_1, id_3);
  tri id_8 = 1, id_9, id_10, id_11, id_12;
endmodule

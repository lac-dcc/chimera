// Seed: 2325202344
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_8;
  always @(*) begin : id_9
    $display;
    id_8[1] <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0(
      id_2, id_1, id_1, id_2, id_2, id_1, id_2
  );
endmodule

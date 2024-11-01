// Seed: 1131996159
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_11(
      .id_0(1), .id_1(id_8)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4;
  logic [7:0] id_5 = id_5[1'b0 : 1];
  generate
    wire id_6;
  endgenerate
  module_0(
      id_3, id_6, id_3, id_4, id_3, id_4, id_4, id_6, id_3, id_6
  ); id_7(
      1'h0
  );
  wire id_8;
  always @(1 or posedge 1) begin
    $display(id_7);
    id_7 = id_3;
    $display(id_2, 1);
  end
endmodule

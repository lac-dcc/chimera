// Seed: 1442236431
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1'h0;
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
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
  always @(1) id_4 = #1 1'b0 & id_5 - (id_4);
  module_0(
      id_2, id_1, id_5, id_10
  );
  wire id_11;
  generate
    if (id_10) begin
      id_12(
          .id_0(1), .id_1(id_8), .id_2(id_8[1]), .id_3(id_6), .id_4(1)
      );
    end else begin : id_13
      assign id_9 = id_4;
    end
  endgenerate
endmodule

// Seed: 756754567
module module_0;
  reg id_1;
  reg id_2;
  always @(1 or posedge 1) begin
    wait (id_1);
  end
  assign id_1 = id_2 * 1 - 1'h0;
  initial begin
    id_1 <= 1;
  end
  always @* begin
    id_2 <= id_1;
    id_2 = 1;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wand id_3;
  final $display(1, 1, id_1);
  wire id_4;
  wand id_5;
  module_0();
  assign id_5#(.id_5(1)) = 1'b0;
  wire id_6;
  id_7(
      .id_0(1),
      .id_1(id_6),
      .id_2(id_2),
      .id_3(1'b0),
      .id_4(1),
      .id_5(id_3),
      .id_6(id_5 + id_3),
      .id_7(1),
      .id_8(1'd0)
  );
  wire id_8;
endmodule

// Seed: 1486998743
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2,
    output tri1 id_3
);
  int id_5;
  assign id_5 = !id_1 << 1'b0;
  wire id_6;
  always @* $display;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    inout  wire  id_2
);
  tri0 id_4;
  not (id_0, id_2);
  assign id_0 = 1'h0 == (1 && (id_4) && id_2);
  wire id_5;
  module_0(
      id_2, id_2, id_2, id_1
  ); id_6(
      .id_0(id_5), .id_1(1), .id_2(1), .id_3(id_2), .id_4(1)
  );
  always @(posedge id_6) id_0 <= 1'd0;
endmodule

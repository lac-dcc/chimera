// Seed: 3712485353
module module_0 ();
  reg id_1;
  reg id_3;
  always @* begin
    id_1 = 1;
  end
  id_4(
      .id_0(id_1), .id_1(id_2), .id_2(id_3)
  );
  always
  fork
    @(posedge 1) begin
      id_3 <= id_1;
    end
  join
  assign id_2 = id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  assign id_1 = id_1#(
      .id_1(1),
      .id_3(1),
      .id_1(1),
      .id_3(1),
      .id_1(id_3 - 1 & 1),
      .id_1(!1)
  );
  wire id_4;
  module_0();
endmodule

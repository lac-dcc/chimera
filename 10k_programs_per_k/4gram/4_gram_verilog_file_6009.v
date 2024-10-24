// Seed: 3384294705
`timescale 1 ps / 1 ps
module module_0 (
    output id_0,
    output id_1,
    input  id_2
);
  logic id_3;
  logic id_4;
  initial begin
    id_5;
    SystemTFIdentifier(1'd0, id_4, id_2);
  end
  assign id_3 = 1;
  wand id_6;
  assign id_6[1'b0] = id_3 & 1 ? 1 : id_6[1];
  assign id_1 = id_4;
  type_12 id_7 (
      .id_0(id_0 == id_2),
      .id_1(id_3),
      .id_2(id_6)
  );
  logic id_8;
endmodule

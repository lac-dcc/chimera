// Seed: 1375232194
module module_0 (
    input  uwire   id_0,
    output supply1 id_1
);
  assign id_1 = id_0 - 1;
  assign id_1 = 1'b0 & id_0 - 1;
endmodule
module module_1 (
    output uwire id_0
);
  assign id_0 = id_2;
  assign id_2 = ~1;
  uwire id_3 = 1;
  tri   id_4;
  always begin
    $display(1 ? id_3 : id_4, id_4 == id_4, id_2, id_2);
  end
  assign id_3 = 1 ^ id_2;
  module_0(
      id_3, id_3
  );
  assign id_4#(
      .id_2(1),
      .id_4(1'b0)
  ) = 1;
  wire id_5;
  wire id_6;
endmodule

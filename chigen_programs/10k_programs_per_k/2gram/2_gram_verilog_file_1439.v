// Seed: 1875333689
module module_0 ();
  reg id_2;
  reg id_3;
  always begin
    id_2 <= #1 id_3;
    assume #1  (id_2);
    id_3 <= 1;
    id_2 <= id_2;
    id_1 <= id_2;
    id_3 <= 1;
  end
  wire id_4;
  id_5 :
  assert property (@(negedge "" - id_3) 1 == 1 + 1)
  else;
endmodule
module module_1 ();
  module_0();
  wire id_2;
  assign id_1 = id_1;
endmodule
module module_2 (
    input tri id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri id_3,
    input tri id_4,
    output uwire id_5,
    input wire id_6,
    input uwire id_7
);
  id_9(
      .id_0(id_5),
      .id_1("" + id_2),
      .id_2('b0),
      .id_3(id_2 - id_3),
      .id_4(id_2),
      .id_5(1'b0),
      .id_6(),
      .id_7((1 - 1)),
      .id_8(1),
      .id_9(1'h0)
  );
  wire id_10;
  wire id_11;
  nand (id_3, id_4, id_6, id_7, id_9);
  always_ff id_5 = id_1;
  wire id_12;
  assign id_3 = id_6;
  module_0();
  assign id_5 = id_1;
endmodule

// Seed: 1354081813
module module_0;
  always #1 id_1 = (1);
  supply1 id_2, id_3;
  assign id_3 = id_1;
  supply0 id_4;
  wire id_5;
  assign id_1 = id_3;
  supply1 id_6 = id_4;
  assign id_4 = 1'h0;
  id_7(
      .id_0(1),
      .id_1(id_5),
      .id_2(1'b0),
      .id_3(id_6),
      .id_4(1 - 1),
      .id_5(1),
      .id_6(id_4 <-> id_2 !== 1),
      .id_7(id_6),
      .id_8(id_6),
      .id_9(1),
      .id_10(id_5),
      .id_11(1 + 1)
  );
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1
);
  reg id_3, id_4;
  always
    if (id_4) id_0 <= id_4;
    else id_0 <= #1 1;
  wire id_5, id_6;
  wire id_7, id_8;
  module_0 modCall_1 ();
  wire id_9 = id_8;
endmodule

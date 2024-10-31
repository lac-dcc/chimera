// Seed: 2845390109
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_4;
  id_8(
      .id_0(id_5),
      .id_1(id_3),
      .id_2(1),
      .id_3(id_4),
      .id_4(id_6 || id_5),
      .id_5(id_2 + id_3),
      .id_6(1'h0),
      .id_7(id_4 && 1'b0 - $display(1)),
      .id_8(),
      .id_9(id_2),
      .id_10(1'h0)
  );
  wand id_9 = 1;
  id_10 :
  assert property (@(posedge 1) 1)
  else $display(1);
  reg id_11, id_12;
  initial id_12 <= 1'b0;
  wire id_13;
endmodule
module module_1 ();
  assign id_1 = !id_1;
  tri id_2 = id_1;
  id_3(
      .id_0(1), .id_1((id_2 ? id_4 : 1)), .id_2(), .id_3(id_2)
  ); module_0(
      id_1, id_2, id_2, id_1, id_2, id_2, id_2
  );
endmodule

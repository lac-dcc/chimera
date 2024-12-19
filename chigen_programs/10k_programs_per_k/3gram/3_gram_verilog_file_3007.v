// Seed: 582847231
module module_0;
  id_1(
      .id_0(id_2), .id_1(), .id_2(), .id_3(1'b0), .id_4(id_2 * 1'b0), .id_5(1), .id_6(id_2)
  ); timeprecision 1ps; id_3 :
  assert property (@(posedge id_3) id_2++)
  else begin : LABEL_0
    id_2 = id_3;
    if (id_3) id_3 <= 1;
  end
  wire id_4;
  wire id_6;
  wire id_7 = id_4;
  id_8(
      .id_0(1), .id_1(id_3), .id_2(1)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri0 id_4
);
  wire id_6, id_7, id_8, id_9, id_10, id_11;
  xor primCall (id_4, id_6, id_7, id_8, id_9);
  module_0 modCall_1 ();
endmodule

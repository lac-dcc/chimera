// Seed: 4015132563
module module_0;
  id_2(
      .id_0(id_3[1 : 1]), .id_1(1'b0)
  );
  always begin : LABEL_0
    deassign id_3;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_6, id_7, id_8;
  module_0 modCall_1 ();
  initial for (id_6 = id_6; 1; id_7 = id_7 == id_6) id_1 <= id_8;
endmodule

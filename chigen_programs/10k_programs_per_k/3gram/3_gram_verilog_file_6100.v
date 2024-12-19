// Seed: 522170098
module module_0;
  wire id_2;
  assign module_2.id_4 = 0;
  final begin : LABEL_0
    id_1 <= 1;
  end
  wire id_3;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  assign id_2[1] = 1;
  wire id_3;
  final $display();
  module_0 modCall_1 ();
  assign id_2[1 : 1] = id_3;
endmodule
module module_2 (
    output wand id_0,
    output wand id_1,
    input tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input tri id_5,
    output logic id_6,
    input tri1 id_7,
    input supply0 id_8,
    input wor id_9
);
  always @*
    if (id_2(id_2) ? 1 : 1) id_6 <= !1 + 1;
    else cover (id_3);
  wire id_11;
  assign id_1 = id_8;
  id_12(
      .id_0(id_6), .id_1(id_0), .id_2(1'b0 & 1), .id_3(id_0 & 1'b0), .id_4(1)
  );
  module_0 modCall_1 ();
  wire id_13, id_14;
endmodule

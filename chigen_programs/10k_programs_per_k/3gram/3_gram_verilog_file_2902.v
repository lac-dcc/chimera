// Seed: 3270481620
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output supply0 id_2,
    input tri1 id_3
);
  id_5 :
  assert property (@(posedge 1) 1'b0)
  else begin : LABEL_0
    #1 id_0 = 1;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output uwire id_1,
    output tri id_2,
    output wor id_3,
    output supply0 id_4,
    input wand id_5,
    input supply0 id_6,
    input wor id_7,
    input wand id_8,
    output supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    output wand id_12,
    input tri1 id_13,
    output wor id_14,
    output supply1 id_15,
    input supply0 id_16
);
  wire id_18, id_19;
  id_20(
      .id_0(1),
      .id_1(1 + id_5),
      .id_2(id_18),
      .id_3(1'b0),
      .id_4(1 - (1 + id_9)),
      .id_5(1),
      .id_6(),
      .id_7(1),
      .id_8(1),
      .id_9(1 - id_16),
      .id_10((id_11)),
      .id_11()
  );
  module_0 modCall_1 (
      id_15,
      id_11,
      id_15,
      id_13
  );
endmodule

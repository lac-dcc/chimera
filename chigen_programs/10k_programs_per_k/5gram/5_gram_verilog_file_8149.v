// Seed: 64926139
module module_0;
  initial begin : LABEL_0
    if (id_1) id_1 <= 1'h0;
    else
      for (id_1 = 1; ~id_1; id_1 = id_1) begin : LABEL_0
        id_1 = id_1;
      end
  end
  assign id_2 = 1;
  always @(*) begin : LABEL_0
    id_2 <= id_2;
  end
  assign id_2 = 1;
  wire id_3;
  wire id_4;
  assign id_2 = (1);
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    output uwire id_2,
    output wire  id_3,
    input  uwire id_4
);
  id_6(
      .find(id_3#(.id_0(1))),
      .id_1(),
      .id_2(id_0),
      .id_3(id_2),
      .id_4(id_4),
      .id_5(1'b0),
      .id_6(id_1)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule

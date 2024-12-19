// Seed: 2141278598
module module_0;
  logic [7:0] id_2;
  wire id_3;
  id_4(
      .id_0(1'b0), .id_1(1), .id_2(id_5), .id_3(), .id_4((id_5))
  );
  wire id_6;
  assign module_1.type_2 = 0;
  supply1 id_7, id_8;
  if (id_7) begin : LABEL_0
    assign id_7 = 1;
  end else begin : LABEL_0
    wire id_9;
    initial begin : LABEL_0
      wait (1);
    end
  end
  wire id_10;
  id_11(
      .id_0(id_8),
      .id_1(id_1[1]),
      .id_2(id_8),
      .id_3(1 - 1),
      .id_4(1),
      .id_5(1),
      .id_6(1'b0 == ~id_2[1 : 1'b0]),
      .id_7(1),
      .id_8(1'h0)
  );
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    output uwire id_2,
    input supply1 id_3
);
  module_0 modCall_1 ();
endmodule

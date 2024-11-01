// Seed: 518589494
module module_0;
  assign id_1 = id_1;
  tri  id_2 = id_2, id_3;
  tri1 id_4;
  wire id_5;
  supply0 id_6, id_7, id_8, id_9 = id_7;
  id_10(
      .id_0(id_6 == id_4),
      .id_1(1'b0),
      .id_2(id_8 == 1),
      .id_3(~id_4),
      .id_4(),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_5),
      .id_8(1),
      .id_9(1),
      .id_10(id_4),
      .id_11(id_1++),
      .id_12(id_2 ~^ 1),
      .id_13(1),
      .id_14(~id_3 && 1'd0)
  );
  wire id_11;
  id_12 :
  assert property (@(posedge id_4) 1'd0)
  else $display(1 == 1, 1 < 1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  supply0 id_4;
  always_comb #(id_4 + id_3[1]) begin
    for (id_4 = 1 && id_4; 1; id_2 = 1) begin
      $display;
    end
  end
  module_0();
  wire id_5, id_6, id_7;
  id_8(
      .id_0(1), .id_1(1), .id_2(1'h0), .id_3(id_7), .id_4(id_2), .id_5(id_3)
  );
  always_ff @(1'b0) begin
    if (1) $display;
  end
endmodule

// Seed: 1575139526
module module_0 (
    input wor id_0,
    input wand id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    output tri0 id_9
);
  tri1 id_11;
  assign id_9  = id_4;
  assign id_11 = 1;
  id_12 :
  assert property (@(posedge 1) id_11)
  else $display(id_8, id_11, id_8, id_12, id_8, id_4, 1, 1 !== 1);
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input wor id_2,
    input supply1 id_3,
    output uwire id_4,
    output tri id_5
);
  always_comb @(posedge 1 or posedge 1'h0) begin : LABEL_0
    id_1 = #1 1;
    $display(id_0, 1);
  end
  always @(posedge id_0) begin : LABEL_0
    id_4 = id_3;
    id_1 = 1'b0;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_5
  );
  assign modCall_1.id_11 = 0;
  wor id_7;
  assign id_1 = 1 == id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  id_11 :
  assert property (@(posedge 1'b0) 1'd0 - 1'b0)
  else $display(1);
endmodule

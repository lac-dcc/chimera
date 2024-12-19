// Seed: 1919409589
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    output uwire id_4,
    input supply1 id_5,
    input tri id_6,
    output wire id_7
);
  assign id_4 = $display(id_5, id_5 - id_6 == id_2, 1'h0);
  assign id_7 = 1;
endmodule
module module_1 (
    input logic id_0,
    output uwire id_1,
    output wire id_2,
    input wand id_3,
    input tri id_4,
    output tri1 id_5,
    input wand id_6,
    input tri0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input tri id_10,
    input uwire id_11,
    input supply0 id_12,
    input supply1 id_13,
    output tri id_14,
    output tri id_15#(
        .id_19(1),
        .id_20(1)
    ),
    output logic id_16,
    input logic id_17
);
  assign id_1 = {id_0 - 1, 1'h0 << id_10, id_20};
  id_21 :
  assert property (@(posedge id_17(id_12) or $display(1, id_9)) id_0) id_16 <= id_17;
  module_0 modCall_1 (
      id_7,
      id_13,
      id_7,
      id_8,
      id_2,
      id_3,
      id_6,
      id_15
  );
  assign modCall_1.id_2 = 0;
  for (id_22 = 1'b0; 1 & 1'h0; id_8 += id_6) begin : LABEL_0
    assign id_2 = 1'h0;
  end
endmodule

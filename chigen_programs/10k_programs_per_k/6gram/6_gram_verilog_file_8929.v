// Seed: 786765459
module module_0;
  supply1 id_2;
  reg id_3;
  always @(1'b0 or posedge id_2) begin
    id_3 <= id_2 & 1;
    #1 $display(1);
    id_1 <= 1'b0;
  end
  assign id_2 = 1;
  id_4(
      .id_0((id_2 || 1)), .id_1(id_3), .id_2((id_3))
  );
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    output tri id_2,
    output tri1 id_3,
    output wor id_4,
    input tri id_5,
    input tri0 id_6,
    input tri id_7,
    input tri0 id_8,
    input tri id_9,
    output wor id_10,
    output wand id_11,
    output supply1 id_12,
    input supply1 id_13,
    output wire id_14,
    output wor id_15,
    output supply1 id_16,
    output tri id_17,
    output wire id_18
);
  tri id_20;
  module_0();
  assign id_14 = 1'b0;
  always @(posedge id_13 != id_7 or id_13) begin
    if (1 && 1'b0)
      case (id_5)
        1: id_11 = 1;
        default: id_16 = id_20;
      endcase
    else id_16 = 1'b0;
  end
  xnor (id_1, id_13, id_20, id_5, id_6, id_7, id_8, id_9);
endmodule

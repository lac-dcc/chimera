// Seed: 3713497767
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input tri id_2,
    input wand id_3,
    input uwire id_4,
    output wire id_5,
    output wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input supply0 id_10,
    input wand id_11
);
  wor id_13 = id_3;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input wand id_3,
    output wand id_4,
    output supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    input uwire id_8,
    input wor id_9
);
  always_latch @(posedge id_7 or posedge id_2) begin
    case (1)
      id_9: id_4 = id_2;
      1: id_5 = 1;
    endcase
  end
  module_0(
      id_2, id_5, id_1, id_9, id_9, id_5, id_4, id_1, id_2, id_1, id_1, id_3
  );
endmodule

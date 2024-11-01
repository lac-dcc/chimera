// Seed: 1082380707
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input supply1 id_6,
    output uwire id_7,
    input tri1 id_8,
    output tri1 id_9,
    input wand id_10,
    input uwire id_11
);
  supply0 id_13;
  if (id_0) begin
    assign id_13 = id_1;
  end else begin
    assign id_5 = ~1;
  end
  assign id_9 = id_13;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input tri0 id_2,
    input uwire id_3,
    output wire id_4
);
  assign id_4 = 1;
  module_0(
      id_3, id_3, id_2, id_3, id_3, id_4, id_0, id_4, id_3, id_4, id_2, id_1
  );
endmodule

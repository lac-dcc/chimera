// Seed: 2122778764
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input wor id_2,
    input wor id_3,
    output supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7
);
endmodule
macromodule module_1 (
    input uwire id_0,
    input tri id_1,
    output tri id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    output supply0 id_11,
    output wor id_12
    , id_15,
    input wire id_13
);
  module_0(
      id_15, id_11, id_4, id_4, id_9, id_4, id_7, id_15
  ); id_16(
      id_6, id_10
  );
  if (id_8) begin
    id_17(
        .id_0(id_3), .id_1(id_15), .id_2(1)
    );
  end else begin
    assign id_15 = id_0;
  end
  assign id_2 = 1'b0;
endmodule

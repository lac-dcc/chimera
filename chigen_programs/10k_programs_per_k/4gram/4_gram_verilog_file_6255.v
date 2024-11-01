// Seed: 1257173059
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wire id_3,
    output tri1 id_4
    , id_28,
    input wand id_5,
    output uwire id_6,
    input wor id_7,
    output uwire id_8,
    input tri1 id_9,
    input supply1 id_10,
    output tri1 id_11,
    input supply0 id_12,
    input supply1 id_13,
    input supply0 id_14,
    output supply0 id_15,
    input uwire id_16,
    input tri id_17,
    output tri0 id_18,
    output tri1 id_19,
    output wand id_20,
    input tri0 id_21,
    input tri0 id_22,
    output tri0 id_23,
    output wor id_24,
    input tri id_25,
    input tri0 id_26
);
  always @* begin
    wait (1'b0);
  end
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri id_5,
    input wor id_6
);
  assign id_2 = 1 ? 1'd0 : id_3;
  module_0(
      id_2,
      id_5,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_6,
      id_0,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_6,
      id_2,
      id_2,
      id_3,
      id_5
  );
  wor id_8;
  assign id_8 = 1;
  for (id_9 = id_0; id_3; id_9 = id_5) begin
    initial
      if (id_9) begin
        id_8 = (1);
        disable id_10;
      end
  end
endmodule

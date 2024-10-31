// Seed: 1446839672
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3,
    output wire id_4,
    output wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wor id_8,
    output tri0 id_9,
    inout supply1 id_10,
    output tri id_11,
    output tri0 id_12,
    output wor id_13,
    input supply0 id_14,
    output tri0 id_15,
    input tri0 id_16,
    input wand id_17,
    input uwire id_18,
    output tri0 id_19
);
  id_21 :
  assert property (@(posedge 1'b0) 1)
  else;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    output wire id_3
);
  supply0 id_5 = id_2;
  generate
    assign id_5 = 1;
    wire id_6;
    reg  id_7;
  endgenerate
  module_0(
      id_3,
      id_1,
      id_5,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3
  );
  always begin
    id_7 <= 1;
  end
endmodule

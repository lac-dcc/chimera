// Seed: 1882526732
module module_0 (
    inout tri0 id_0,
    input supply0 id_1,
    output wor id_2,
    input wor id_3,
    inout tri1 id_4,
    input uwire id_5,
    inout tri1 id_6,
    output tri1 id_7,
    output supply1 id_8,
    input uwire id_9,
    input uwire id_10,
    input uwire id_11,
    input wire id_12,
    output tri0 id_13,
    input supply0 id_14,
    output tri1 id_15,
    input tri id_16,
    input wand id_17,
    input uwire id_18,
    output supply0 id_19,
    input tri1 id_20,
    output tri1 id_21
);
  assign id_0 = id_10;
  for (id_23 = id_5 == ""; id_10; id_6 = 1) begin
    id_24 :
    assert property (@(1 or negedge 1'h0) id_17)
    else;
    assign id_19 = id_12;
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    inout wor id_2,
    input uwire id_3
);
  wire id_5;
  module_0(
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_2,
      id_0,
      id_1,
      id_0
  );
endmodule

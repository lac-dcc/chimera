// Seed: 2289773654
module module_0 (
    input tri id_0,
    output wor id_1,
    output tri1 id_2,
    output tri1 id_3,
    output wire id_4,
    input tri1 id_5,
    output uwire id_6,
    output wand id_7,
    output supply1 id_8,
    output wand id_9,
    input wire id_10,
    input tri1 id_11,
    output wire id_12,
    input tri1 id_13,
    input supply0 id_14
    , id_17,
    output tri0 id_15
);
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    output wire id_2,
    input wor id_3,
    input wor id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wand id_9,
    output uwire id_10,
    inout wire id_11,
    output tri id_12,
    input wor id_13,
    input tri1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    input wor id_17,
    input wor id_18,
    input supply0 id_19,
    input tri1 id_20,
    input supply1 id_21,
    output tri0 id_22,
    input supply0 id_23,
    output tri id_24,
    input tri1 id_25,
    output tri1 id_26,
    input supply1 id_27,
    output uwire id_28,
    inout tri1 id_29,
    output supply1 id_30,
    output tri1 id_31,
    output wor id_32,
    output tri id_33,
    output tri1 id_34,
    input supply0 id_35,
    input wand id_36,
    output uwire id_37,
    input supply0 id_38,
    input tri0 id_39,
    input tri0 id_40
);
  id_42 :
  assert property (@(1'b0) id_0)
  else begin
    return 1;
  end
  id_43(
      .id_0(1), .id_1(1), .id_2(id_23 * 1 == id_40 + (id_8))
  );
  wand id_44;
  initial begin
    id_44 = id_42;
  end
  module_0(
      id_4,
      id_12,
      id_29,
      id_44,
      id_34,
      id_23,
      id_42,
      id_12,
      id_26,
      id_34,
      id_25,
      id_38,
      id_12,
      id_9,
      id_18,
      id_26
  );
endmodule

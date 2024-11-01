// Seed: 3496603325
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input uwire id_4,
    input wand id_5,
    output tri0 id_6,
    output tri0 id_7,
    input tri id_8,
    output uwire id_9,
    input supply0 id_10,
    output wor id_11
    , id_33,
    input wand id_12,
    input supply1 id_13,
    input uwire id_14,
    input wor id_15,
    output wire id_16,
    input uwire id_17,
    input supply0 id_18,
    output wor id_19,
    input tri0 id_20,
    output tri id_21,
    input supply1 id_22,
    output tri0 id_23
    , id_34,
    input wor id_24,
    input tri1 id_25,
    input supply0 id_26,
    input tri0 id_27,
    input wand id_28,
    output wire id_29,
    output wire id_30,
    input tri0 id_31
);
  assign id_23 = $display;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input wire id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    output wor id_6,
    input wor id_7#(
        .id_14(~id_2),
        .id_15(1),
        .id_16(1),
        .id_17(1)
    ),
    output uwire id_8,
    input uwire id_9,
    output uwire id_10,
    input supply0 id_11,
    input tri id_12
);
  assign id_8 = 1;
  for (id_18 = 1; id_5; id_8 = (1)) begin
    assign id_4 = id_15;
  end
  wire id_19;
  module_0(
      id_0,
      id_2,
      id_12,
      id_18,
      id_1,
      id_3,
      id_4,
      id_15,
      id_2,
      id_8,
      id_15,
      id_18,
      id_9,
      id_7,
      id_11,
      id_9,
      id_17,
      id_7,
      id_11,
      id_8,
      id_15,
      id_17,
      id_5,
      id_17,
      id_2,
      id_9,
      id_5,
      id_0,
      id_0,
      id_17,
      id_17,
      id_2
  );
  assign id_4  = id_9 ? 1 : id_3 ? 1 : 1 ? 1 : id_18;
  assign id_17 = id_1;
  id_20(
      .id_0(1'b0), .id_1(id_17), .id_2(id_14), .id_3(1'b0)
  );
endmodule

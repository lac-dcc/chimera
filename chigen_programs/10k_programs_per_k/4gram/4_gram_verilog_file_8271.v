// Seed: 1741133738
module module_0 (
    output tri id_0,
    output tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output wand id_5,
    input wand id_6,
    input wand id_7,
    input wand id_8,
    input wor id_9,
    output tri id_10,
    input wor id_11,
    output uwire id_12,
    output uwire id_13,
    output wand id_14,
    output tri0 id_15,
    input wor id_16,
    input supply1 id_17,
    input wand id_18
    , id_27,
    input wire id_19,
    input wire id_20
    , id_28,
    input tri id_21,
    output tri id_22,
    input tri0 id_23
    , id_29,
    output tri1 id_24,
    input tri1 id_25
);
  wire id_30;
endmodule
module module_1 (
    output wire id_0,
    output wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wire id_6,
    output supply1 id_7,
    input wor id_8,
    output tri0 id_9,
    input uwire id_10,
    output wand id_11,
    input tri1 id_12,
    input supply0 id_13,
    input tri0 id_14,
    output wire id_15,
    input wire id_16,
    input uwire id_17,
    output uwire id_18,
    inout tri id_19,
    output tri id_20,
    input tri0 id_21,
    input tri1 id_22,
    input tri0 id_23,
    input tri0 id_24,
    wire id_26
);
  assign id_9 = id_24;
  id_27 :
  assert property (@(posedge id_5) 1'b0)
  else $display;
  module_0(
      id_20,
      id_11,
      id_10,
      id_11,
      id_27,
      id_19,
      id_16,
      id_14,
      id_10,
      id_13,
      id_20,
      id_27,
      id_1,
      id_1,
      id_27,
      id_4,
      id_12,
      id_17,
      id_14,
      id_5,
      id_17,
      id_13,
      id_4,
      id_24,
      id_4,
      id_19
  ); id_28(
      .id_0(id_20), .id_1(), .id_2(id_10)
  );
endmodule

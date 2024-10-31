// Seed: 214851620
module module_0 (
    output tri0 id_0,
    input wor id_1,
    output supply1 id_2,
    input uwire id_3,
    input tri1 id_4,
    output wire id_5,
    input tri id_6,
    input uwire id_7,
    output wor id_8,
    output uwire id_9
    , id_35,
    input wire id_10,
    input tri id_11,
    output wand id_12,
    input tri0 id_13,
    output wand id_14
    , id_36,
    input tri1 id_15
    , id_37,
    output supply1 id_16,
    input wor id_17,
    output wor id_18,
    input supply1 id_19,
    input tri0 id_20,
    output wor id_21,
    input tri id_22,
    output supply1 id_23,
    input uwire id_24,
    input wor id_25,
    input tri1 id_26,
    input wand id_27,
    input uwire id_28,
    input tri1 id_29,
    output supply1 id_30,
    input wand id_31,
    input wor id_32,
    output supply0 id_33
);
  id_38(
      .id_0(id_23), .id_1(1'h0), .id_2(id_5)
  );
  assign id_21 = 1;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    output wand id_2,
    output uwire id_3,
    input wand id_4,
    input wand id_5,
    input wire id_6,
    input tri id_7
    , id_11,
    input supply1 id_8,
    output wor id_9
);
  always @(posedge 1) begin
    id_0 <= ~id_5;
  end
  xor (id_2, id_11, id_6, id_8, id_7, id_4);
  module_0(
      id_2,
      id_7,
      id_2,
      id_7,
      id_7,
      id_2,
      id_8,
      id_8,
      id_3,
      id_2,
      id_1,
      id_8,
      id_9,
      id_4,
      id_3,
      id_4,
      id_3,
      id_7,
      id_2,
      id_1,
      id_8,
      id_9,
      id_4,
      id_3,
      id_6,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_3,
      id_1,
      id_6,
      id_2
  );
endmodule

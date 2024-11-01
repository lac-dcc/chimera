// Seed: 2841764503
module module_0 (
    output supply0 id_0,
    output tri id_1
    , id_23,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    output wor id_5,
    input wor id_6,
    input tri id_7,
    input supply1 id_8,
    input wire id_9,
    output wire id_10,
    input tri1 id_11,
    output supply1 id_12,
    output tri1 id_13,
    input tri id_14,
    input wand id_15,
    output supply0 id_16,
    output uwire id_17,
    input uwire id_18,
    input tri id_19,
    output wand id_20,
    input wire id_21
);
  if (id_23) assign id_13 = 1'h0;
  else begin
    wire id_24;
    wire id_25;
  end
  assign id_1 = id_11;
  integer id_26;
endmodule
module module_1 (
    output wand id_0,
    output tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output wand id_6,
    input tri1 id_7
);
  assign id_1 = id_4 ? 1 : 1;
  module_0(
      id_1,
      id_0,
      id_6,
      id_5,
      id_3,
      id_6,
      id_5,
      id_5,
      id_3,
      id_3,
      id_0,
      id_7,
      id_6,
      id_6,
      id_2,
      id_2,
      id_0,
      id_1,
      id_3,
      id_7,
      id_0,
      id_3
  );
endmodule

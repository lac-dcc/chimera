// Seed: 2243632136
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri id_2,
    input tri0 id_3,
    output supply1 id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    input wire id_8,
    output wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    input uwire id_12,
    input tri0 id_13,
    input uwire id_14,
    output tri1 id_15,
    input wire id_16,
    input tri id_17,
    input uwire id_18,
    output uwire id_19,
    input supply0 id_20,
    output tri0 id_21,
    input wire id_22,
    output wor id_23,
    input wand id_24,
    input tri id_25 id_37,
    output wor id_26,
    input uwire id_27,
    input tri id_28,
    output uwire id_29,
    input tri0 id_30,
    input tri0 id_31,
    input wand id_32,
    input supply0 id_33,
    input wand id_34,
    input tri id_35
);
endmodule
module module_1 #(
    parameter id_3 = 32'd5,
    parameter id_4 = 32'd21
) (
    output supply0 id_0,
    input tri1 id_1
);
  if (id_1) begin
    defparam id_3.id_4 = 1;
  end else begin
    wand id_5 = id_1;
    assign id_5 = 1 ? 1 : 1;
  end
  module_0(
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule

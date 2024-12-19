// Seed: 2346153086
module module_0 #(
    parameter id_31 = 32'd86,
    parameter id_32 = 32'd92
) (
    input tri id_0,
    output uwire id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    output uwire id_5,
    output supply1 id_6,
    input wire id_7,
    input wire id_8,
    output tri id_9,
    output tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input uwire id_14,
    output tri id_15,
    input uwire id_16,
    output tri id_17,
    input wand id_18,
    input wire id_19,
    input wor id_20
    , id_29,
    input supply0 id_21,
    output supply1 id_22,
    output wand id_23,
    output supply1 id_24,
    output supply0 id_25,
    input supply1 id_26,
    input tri id_27
);
  assign id_23 = {id_27{1}} ? id_3 : 1;
  wor id_30 = 1;
  defparam id_31.id_32 = ~id_27 == 1'h0 >= 1;
  assign id_5 = 1;
  wire id_33;
  wire id_34;
  wire id_35;
  wire id_36;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    output tri0 id_5,
    output wand id_6,
    input tri1 id_7,
    output logic id_8,
    input tri id_9,
    input supply1 id_10,
    output uwire id_11,
    input tri0 id_12
);
  always @(posedge 1 or negedge 1'b0 === id_7 - 1) if (id_7) id_8 <= 1 == 1'b0;
  wire id_14, id_15, id_16, id_17;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_4,
      id_2,
      id_2,
      id_3,
      id_6,
      id_10,
      id_2,
      id_5,
      id_5,
      id_4,
      id_1,
      id_12,
      id_10,
      id_11,
      id_1,
      id_5,
      id_4,
      id_4,
      id_9,
      id_10,
      id_11,
      id_6,
      id_11,
      id_5,
      id_7,
      id_10
  );
endmodule

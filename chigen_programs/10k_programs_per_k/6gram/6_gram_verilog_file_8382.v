// Seed: 861333800
module module_0 #(
    parameter id_28 = 32'd91,
    parameter id_29 = 32'd80
) (
    output tri0 id_0,
    output uwire id_1,
    input wire id_2,
    input wor id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wand id_7,
    input tri1 id_8,
    output supply0 id_9,
    input tri0 id_10,
    output wire module_0,
    input wire id_12,
    input wire id_13,
    input wor id_14,
    output wire id_15,
    input tri0 id_16,
    input supply1 id_17,
    output supply1 id_18,
    input wire id_19,
    output uwire id_20
);
  assign id_20 = id_16;
  wire id_22, id_23, id_24, id_25, id_26;
  wire id_27;
  defparam id_28.id_29 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    input tri id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    output logic id_9,
    input supply1 id_10,
    output supply1 id_11,
    input wire id_12,
    input wor id_13,
    output supply1 id_14,
    output wand id_15,
    input wire id_16
);
  always @(id_10) begin
    id_9 <= 1;
  end
  module_0(
      id_14,
      id_11,
      id_3,
      id_5,
      id_4,
      id_5,
      id_8,
      id_12,
      id_16,
      id_15,
      id_16,
      id_14,
      id_10,
      id_0,
      id_8,
      id_1,
      id_2,
      id_7,
      id_15,
      id_4,
      id_14
  );
  always @(posedge id_0) begin
    id_1 = id_0;
    if (1) id_9 = 1;
  end
endmodule

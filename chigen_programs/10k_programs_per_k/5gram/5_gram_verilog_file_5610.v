// Seed: 2784448369
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input tri id_2,
    output tri1 id_3,
    output wire id_4,
    input wire id_5,
    output supply1 id_6,
    input tri id_7,
    output wand id_8,
    input supply0 id_9,
    input wand id_10,
    output wor id_11,
    input wire id_12,
    output wire id_13,
    input tri0 id_14,
    input supply1 id_15,
    input supply0 id_16,
    output supply1 id_17,
    output tri id_18,
    output supply0 id_19,
    output uwire id_20,
    input uwire id_21,
    input uwire id_22,
    input wor id_23,
    input wor id_24,
    input uwire id_25
    , id_30,
    input uwire id_26,
    output tri id_27,
    input wand id_28
);
  wire id_31;
  wire id_32 = 'b0;
endmodule
module module_1 (
    input logic id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    output logic id_4,
    input logic id_5,
    output tri1 id_6,
    input supply0 id_7,
    input uwire id_8,
    output wand id_9,
    input tri1 id_10,
    output logic id_11,
    input tri1 id_12,
    output wor id_13
);
  wor id_15 = 1 - 1;
  module_0(
      id_6,
      id_6,
      id_12,
      id_13,
      id_9,
      id_2,
      id_13,
      id_8,
      id_9,
      id_12,
      id_1,
      id_6,
      id_7,
      id_6,
      id_8,
      id_1,
      id_10,
      id_6,
      id_9,
      id_13,
      id_9,
      id_2,
      id_10,
      id_12,
      id_8,
      id_8,
      id_2,
      id_6,
      id_2
  );
  wire id_16;
  wire id_17;
  always @(posedge 1) begin
    if (id_8)
      if (id_15++ == id_5)
        if (1) id_11 <= "";
        else id_4 <= 1;
      else {id_5, id_0} <= 1 ? 1'b0 : 1'd0;
  end
  assign id_13 = 1;
endmodule

// Seed: 3019222583
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input wor id_2,
    output wor id_3,
    output tri id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    output wand id_8,
    input wire id_9,
    input supply1 id_10,
    output tri0 id_11,
    input wand id_12,
    input tri1 id_13,
    input wand id_14,
    input uwire id_15,
    input supply0 id_16,
    input supply0 id_17,
    input tri0 id_18,
    input wire id_19
);
  wand id_21 = 1 ? !id_5 : 1 * id_17;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input tri id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    output tri0 id_6,
    input logic id_7
    , id_11,
    input tri0 id_8,
    output tri1 id_9
);
  reg id_12 = !id_11 >= 1;
  supply0 id_13;
  assign id_11 = 1;
  always @(1 or 1)
    if (id_12)
      if (id_5) id_12 <= id_7;
      else id_1 <= id_7;
  supply1 id_14;
  reg id_15;
  initial id_12 = #1 1'h0;
  always
    case (id_8)
      id_13:   id_14 = 1;
      default: id_15 <= id_15;
    endcase
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_6,
      id_9,
      id_4,
      id_0,
      id_4,
      id_9,
      id_13,
      id_4,
      id_13,
      id_3,
      id_13,
      id_8,
      id_3,
      id_4,
      id_3,
      id_4,
      id_5
  );
  assign id_6 = 1;
endmodule

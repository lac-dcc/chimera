// Seed: 430191650
module module_0 (
    input  wor  id_0,
    input  tri  id_1,
    input  wand id_2,
    output wand id_3,
    input  tri0 id_4
);
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wor id_3,
    output supply0 id_4,
    input wand id_5,
    input wor id_6
);
  wire id_8;
  module_0(
      id_6, id_5, id_5, id_0, id_6
  );
endmodule
module module_2 (
    input logic id_0,
    output tri0 id_1,
    output wor id_2,
    output logic id_3,
    output uwire id_4,
    input tri id_5,
    input supply0 id_6,
    input wor id_7,
    output wire id_8,
    output wire id_9,
    input supply1 id_10,
    input tri0 id_11,
    output uwire id_12,
    output wire id_13,
    output logic id_14,
    output tri id_15,
    output tri id_16,
    output wire id_17,
    output logic id_18,
    output tri id_19,
    output supply1 id_20
    , id_28,
    output uwire id_21,
    input wire id_22,
    output tri id_23,
    output uwire id_24,
    output tri0 id_25,
    input tri0 id_26
);
  assign id_8 = 1;
  assign #(1) id_24 = id_26;
  always @(posedge id_26 - id_11 or 1) begin
    id_14 <= id_0;
    id_3  <= id_10 - 1;
    `define pp_29 0
    id_18 <= 1;
  end
  module_0(
      id_22, id_22, id_10, id_1, id_6
  );
  wire id_30;
  nor (id_9, id_5, id_0, id_10, id_7, id_22, id_26, id_28);
endmodule

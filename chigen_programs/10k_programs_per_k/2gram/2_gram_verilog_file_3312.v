// Seed: 1663407671
macromodule module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wire id_6,
    output wire id_7
);
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri id_4,
    output tri id_5
    , id_24,
    output tri1 id_6,
    output tri0 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input wire id_10,
    input wire id_11,
    input uwire id_12,
    output supply0 id_13,
    input wand id_14,
    output tri0 id_15,
    input wor id_16,
    input tri1 id_17,
    output supply1 id_18,
    input wor id_19,
    output uwire id_20,
    output tri1 id_21,
    input tri id_22
);
  wor id_25, id_26 = {1'b0, 1'b0, 1}, id_27, id_28, id_29;
  initial
    @(posedge id_11)
      if (id_17) begin
        id_25 = id_17;
      end
  module_0(
      id_8, id_8, id_27, id_28, id_14, id_21, id_5, id_6
  );
  wire id_30;
  assign id_26#(
      .id_12(id_27 - id_3),
      .id_3 (1 | (1) | id_12)
  ) = 1 - id_10;
endmodule

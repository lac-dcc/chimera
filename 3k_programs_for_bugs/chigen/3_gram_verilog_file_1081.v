// Seed: 2733439564
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input wire id_2,
    input wire id_3,
    output supply1 id_4,
    output uwire id_5,
    output tri0 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output wor id_9,
    input wire id_10,
    output wand id_11
    , id_20,
    input wand id_12,
    input tri id_13,
    output wor id_14,
    input supply1 id_15,
    input wand id_16,
    input wor id_17,
    input tri id_18
);
  initial $display(1);
  id_21(
      .id_0(1), .id_1({1, {id_4{1}}, id_0})
  );
  assign id_4 = id_17;
  reg  id_22;
  wire id_23;
  wire id_24;
  wire id_25;
  assign id_5 = 1;
  wire id_26;
  tri0 id_27 = 1 ^ (1);
  reg  id_28;
  wire id_29;
  always @(id_2)
    if (id_3) begin
      id_22 <= 1;
      id_28 <= 1;
    end
endmodule
macromodule module_1 (
    input  wor  id_0,
    input  wand id_1,
    output tri  id_2,
    input  wire id_3
);
  wire id_5;
  and (id_2, id_3, id_5, id_1);
  module_0(
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_0,
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0
  );
endmodule

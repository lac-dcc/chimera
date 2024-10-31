// Seed: 3114588296
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output wor id_3,
    output wand id_4,
    output wor id_5,
    output wor id_6,
    output uwire id_7,
    output wor id_8,
    input tri0 id_9,
    input wire id_10,
    input wire id_11,
    input wire id_12
);
  always @(posedge 1 or negedge id_0) id_3 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    output uwire id_2,
    output supply1 id_3
);
  tri id_5, id_6, id_7, id_8;
  assign id_5 = 1;
  always @(posedge id_6)
    if (id_7) begin
      assign id_6 = 1'b0 > id_8;
    end
  module_0(
      id_1, id_1, id_1, id_0, id_3, id_3, id_0, id_2, id_3, id_1, id_1, id_1, id_1
  ); specify
    (id_9 => id_10) = 1;
    (id_11 => id_12) = 1;
    $setup(id_13, negedge id_14, id_13);
    (negedge id_15 => (id_16 +: 1)) = 1;
    (id_17 => id_18) = (1, id_11 == id_12 < 1  : 1'b0 : 1);
    (id_19 => id_20) = 1;
  endspecify
  wor id_21 = id_8;
endmodule

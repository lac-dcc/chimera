// Seed: 1055429146
module module_0 (
    input wire id_0,
    input wire id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri0 id_4,
    input wor id_5,
    input supply0 id_6,
    output tri id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wand id_10,
    input tri0 id_11,
    input wor id_12,
    input wire id_13,
    input supply0 id_14,
    input tri1 id_15,
    input uwire id_16,
    input tri1 id_17,
    output tri id_18
);
  always @(posedge id_10 or posedge id_17) $display;
endmodule
module module_1 (
    output wire id_0,
    output uwire id_1,
    output wand id_2,
    output tri id_3,
    input uwire id_4,
    input uwire id_5,
    output tri1 id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9,
    output supply1 id_10,
    input tri id_11
);
  always force id_2 = 1;
  module_0(
      id_5,
      id_4,
      id_8,
      id_1,
      id_11,
      id_5,
      id_5,
      id_9,
      id_1,
      id_8,
      id_11,
      id_8,
      id_5,
      id_7,
      id_11,
      id_5,
      id_5,
      id_8,
      id_2
  );
  always #1 begin
    $display(1, 1);
  end
endmodule

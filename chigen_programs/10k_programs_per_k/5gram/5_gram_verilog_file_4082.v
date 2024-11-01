// Seed: 1753745104
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    output wand id_2,
    output wand id_3,
    output supply0 id_4,
    output wor id_5,
    input tri1 id_6,
    input wor id_7,
    input uwire id_8,
    input wor id_9,
    output supply1 id_10,
    output wor id_11,
    input wor id_12
);
  id_14(
      .id_0(id_11), .id_1(1)
  );
endmodule
module module_1 (
    output uwire id_0,
    output tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri id_5,
    input supply0 id_6,
    output tri0 id_7,
    input wire id_8,
    output supply0 id_9,
    output wand id_10
);
  wire id_12;
  tri0 id_13;
  module_0(
      id_0, id_5, id_1, id_5, id_2, id_13, id_8, id_13, id_6, id_8, id_1, id_0, id_6
  );
  always @(*)
    #0 begin
      $display(id_8, id_13);
    end
endmodule

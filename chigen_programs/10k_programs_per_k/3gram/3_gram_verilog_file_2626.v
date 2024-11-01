// Seed: 744778426
module module_0 (
    output uwire id_0,
    output wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    output wor id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri id_7,
    input wor id_8
);
  always #1 begin
    $display(1'b0);
  end
  module_2(
      id_3, id_1, id_1, id_8, id_5, id_3, id_5, id_8
  );
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    input supply1 id_2
);
  initial begin
    #1;
  end
  wire id_4;
  module_0(
      id_1, id_1, id_0, id_2, id_1, id_0, id_1, id_1, id_2
  );
endmodule
module module_2 (
    input tri id_0,
    output supply0 id_1,
    output wor id_2,
    input tri id_3,
    input wand id_4,
    input wand id_5,
    input supply1 id_6,
    input supply0 id_7
);
endmodule

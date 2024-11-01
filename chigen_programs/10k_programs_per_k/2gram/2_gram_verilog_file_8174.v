// Seed: 3640769693
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input uwire id_6,
    output tri id_7,
    output tri1 id_8,
    input uwire id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri0 id_12
);
  wor id_14;
  assign id_14 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output tri1 id_6,
    input supply0 id_7
);
  assign id_2 = 1;
  module_0(
      id_7, id_0, id_5, id_0, id_3, id_6, id_5, id_6, id_6, id_3, id_3, id_7, id_5
  );
  always begin
    $display(id_4, 1'b0 && 1, id_5, 1'b0);
  end
endmodule

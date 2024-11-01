// Seed: 2317825906
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    output supply1 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6
);
  wire id_8, id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_14 = 32'd51,
    parameter id_15 = 32'd31
) (
    input uwire id_0,
    input wire id_1,
    input uwire id_2,
    input supply0 id_3,
    input uwire id_4,
    input wand id_5,
    output tri id_6
    , id_11,
    input uwire id_7,
    output uwire id_8,
    output tri id_9
);
  if (id_2) wire id_12;
  else begin : id_13
    defparam id_14.id_15 = id_2 && 1;
  end
  and (id_8, id_7, id_2, id_11, id_0, id_1);
  module_0(
      id_5, id_4, id_8, id_8, id_1, id_5, id_5
  );
endmodule

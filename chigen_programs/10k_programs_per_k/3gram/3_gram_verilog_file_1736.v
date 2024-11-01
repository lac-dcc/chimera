// Seed: 267812985
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5,
    input tri id_6,
    output tri id_7,
    input supply0 id_8,
    input tri0 id_9,
    input tri id_10
    , id_25,
    output supply0 id_11,
    input tri0 id_12,
    input wor id_13,
    input wor id_14,
    input supply0 id_15,
    input wand id_16,
    input wand id_17,
    input wor id_18,
    output uwire id_19,
    output wor id_20,
    input uwire id_21,
    output uwire id_22,
    input tri id_23
);
  always_ff @(id_13);
  assign id_20 = id_1;
endmodule
module module_1 (
    output wor  id_0,
    output tri  id_1,
    input  wand id_2,
    output wand id_3,
    input  tri0 id_4,
    input  tri  id_5,
    output tri0 id_6,
    input  tri1 id_7
);
  final begin
    $display(1);
  end
  notif1 (id_6, id_5, id_2);
  module_0(
      id_2,
      id_5,
      id_5,
      id_5,
      id_4,
      id_6,
      id_5,
      id_6,
      id_7,
      id_5,
      id_4,
      id_0,
      id_5,
      id_7,
      id_2,
      id_2,
      id_5,
      id_7,
      id_7,
      id_6,
      id_0,
      id_5,
      id_1,
      id_4
  );
endmodule

// Seed: 2217931856
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input tri id_2,
    output supply0 id_3,
    output supply1 id_4,
    output wor id_5,
    input tri1 id_6,
    output supply1 id_7,
    inout tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output uwire id_11,
    input tri1 id_12
    , id_25,
    input tri0 id_13,
    input wire id_14,
    input wire id_15,
    output wand id_16,
    output tri0 id_17,
    output wand id_18,
    input tri1 id_19,
    input supply0 id_20,
    input wire id_21,
    output tri0 id_22,
    input tri1 id_23
);
endmodule
module module_1 (
    input uwire id_0,
    input tri   id_1
);
  tri0 id_3;
  wor  id_4;
  id_5 :
  assert property (@(posedge id_0) id_4)
  else begin
    id_3 = id_0;
  end
  assign id_5 = 1;
  integer id_6;
  module_0(
      id_3,
      id_0,
      id_3,
      id_4,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_1,
      id_5,
      id_4,
      id_1,
      id_4,
      id_4,
      id_5,
      id_5,
      id_5,
      id_3,
      id_4,
      id_4,
      id_5,
      id_4,
      id_1
  );
endmodule

// Seed: 1303331708
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output uwire id_2,
    output tri0 id_3,
    input tri id_4,
    input supply0 id_5,
    output wor id_6,
    output tri1 id_7,
    output supply0 id_8,
    output tri0 id_9,
    output tri1 id_10,
    input tri id_11,
    input tri id_12,
    input wire id_13,
    input wire id_14,
    input tri id_15,
    output supply0 id_16,
    output tri0 id_17
);
  wire id_19;
  wire id_20, id_21;
  wire id_22, id_23;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    output tri1 id_2,
    input wor id_3,
    input tri1 id_4,
    input wire id_5,
    input supply0 id_6
);
  id_8 :
  assert property (@(negedge 1) id_6)
  else begin
    id_1 = id_6;
  end
  module_0(
      id_8,
      id_5,
      id_1,
      id_1,
      id_6,
      id_4,
      id_1,
      id_2,
      id_8,
      id_1,
      id_2,
      id_8,
      id_5,
      id_3,
      id_3,
      id_5,
      id_8,
      id_8
  );
endmodule

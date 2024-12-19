// Seed: 3822622811
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  assign id_3 = id_2[1][1'b0];
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  id_6(
      id_5
  );
endmodule
module module_2 (
    input supply1 id_0,
    output supply0 id_1,
    output wor id_2,
    output tri id_3,
    input tri0 id_4,
    input wand id_5,
    input tri id_6,
    input wor id_7,
    output wor id_8,
    output tri0 id_9,
    input wand id_10,
    output wire id_11,
    output supply0 id_12,
    input tri0 id_13,
    input wire id_14,
    input supply1 id_15,
    input tri1 id_16,
    input tri id_17,
    input uwire id_18,
    input tri0 id_19,
    input tri id_20
);
  wire id_22;
  wire id_23;
  assign id_1 = 1;
  wire id_24;
endmodule
module module_3 (
    input tri1 id_0,
    output tri1 id_1,
    output tri id_2,
    input logic id_3,
    output supply1 id_4,
    output uwire id_5,
    output tri1 id_6,
    input logic id_7,
    output supply0 id_8
);
  id_10 :
  assert property (@(1 or posedge id_7) id_3)
  else if (1) id_10 <= id_10;
  module_2 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_8,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_14 = 0;
endmodule

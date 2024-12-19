// Seed: 3782034875
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  specify
    if (id_7) (posedge id_8 => (id_9 +: 1)) = (id_1  : "" == id_5  : id_6, 1);
  endspecify
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input wand id_4,
    input supply1 id_5,
    input wand id_6,
    output tri id_7,
    output uwire id_8
    , id_16,
    input wire id_9
    , id_17,
    output supply1 id_10,
    output supply0 id_11,
    input wor id_12
    , id_18,
    input tri1 id_13,
    output supply0 id_14
);
  genvar id_19;
  or primCall (id_7, id_6, id_19, id_12, id_0, id_13, id_1, id_2, id_17, id_5, id_3, id_9, id_16);
  module_0 modCall_1 (
      id_19,
      id_19,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18
  );
  assign modCall_1.id_8 = 0;
endmodule

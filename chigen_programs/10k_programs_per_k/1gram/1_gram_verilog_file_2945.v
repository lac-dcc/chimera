// Seed: 3174788667
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri id_9,
    input tri1 id_10,
    output wor id_11,
    output wand id_12,
    output supply1 id_13,
    output supply0 id_14,
    input tri0 id_15,
    output supply1 id_16,
    input wire id_17,
    output tri id_18,
    input supply1 id_19
);
  wire id_21;
  wire id_22, id_23;
  uwire id_24, id_25 = id_5, id_26, id_27;
  always id_18 = 1'b0;
  wire id_28;
  always $display(id_28);
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input wire id_2,
    output wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input supply1 id_6,
    output tri id_7,
    input tri0 id_8
);
  assign id_3 = id_6;
  module_0(
      id_3,
      id_8,
      id_4,
      id_8,
      id_4,
      id_8,
      id_6,
      id_6,
      id_0,
      id_2,
      id_8,
      id_5,
      id_5,
      id_1,
      id_3,
      id_0,
      id_7,
      id_4,
      id_1,
      id_6
  );
  wire id_10, id_11;
  wire id_12;
  wire id_13, id_14;
  assign id_5 = {id_6 == id_6{id_6 - 1}};
  wire id_15 = id_8;
endmodule

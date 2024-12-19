// Seed: 1282511269
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wire id_7,
    input tri0 id_8,
    input tri id_9,
    output tri id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    output supply1 id_14,
    output supply1 id_15,
    output supply0 id_16,
    input wire id_17,
    input wor id_18,
    input wand id_19
);
  id_21(
      ~id_19
  );
  wire id_22;
  assign module_1.id_1 = 0;
  wire id_23, id_24;
  supply0 id_25 = id_9;
  genvar id_26;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0
  );
  wire id_5;
endmodule

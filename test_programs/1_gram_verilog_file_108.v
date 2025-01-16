// Seed: 3265236110
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output tri0 id_2,
    output tri id_3,
    input wor id_4,
    output wor id_5,
    input supply1 id_6,
    output wire id_7,
    output tri id_8,
    id_18,
    input wand id_9,
    input tri0 id_10,
    input wand id_11,
    input tri1 id_12,
    input wand id_13,
    output tri0 id_14,
    output tri0 id_15,
    output uwire id_16
);
  tri1 id_19, id_20;
  wire id_21 = id_19, id_22 = id_1;
  assign id_8 = (id_20);
  wire id_23, id_24;
  id_25(
      .id_0(1), .id_1(1), .id_2(id_16), .id_3(id_13)
  );
  wire id_26;
  always if (id_20);
  wire id_27, id_28;
  wire id_29, id_30;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wor id_4,
    input wor id_5,
    input logic id_6,
    output logic id_7
);
  genvar id_9;
  always id_7 <= id_6;
  wor id_10, id_11;
  module_0 modCall_1 (
      id_11,
      id_2,
      id_11,
      id_11,
      id_3,
      id_11,
      id_10,
      id_11,
      id_10,
      id_10,
      id_10,
      id_4,
      id_5,
      id_2,
      id_10,
      id_10,
      id_10
  );
  assign modCall_1.id_7 = 0;
  assign id_10 = id_0;
  assign id_7 = -1;
  wire id_12;
  assign id_11 = id_12 << id_5;
  assign id_11 = 1;
endmodule

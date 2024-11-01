// Seed: 144738099
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input wor id_2,
    input tri id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    input supply1 id_8,
    input wor id_9,
    output wand id_10,
    input tri0 id_11,
    input tri id_12,
    input tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    input wire id_16,
    input tri0 id_17,
    input tri1 id_18,
    input wire id_19,
    input tri0 id_20,
    input supply0 id_21,
    output wor id_22,
    input supply0 id_23,
    output supply0 id_24,
    output wor id_25
);
  integer id_27 (
      .id_0(id_9),
      .id_1(1'b0),
      .id_2(1)
  );
  wire id_28;
  wire id_29;
  wire id_30, id_31;
  wire id_32;
  wire id_33;
  assign id_33 = id_29;
  int id_34;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    output logic id_6
);
  always
    case (1)
      1: id_6 = 1;
      id_5: id_0 = (id_5);
      default: id_6 <= !id_5;
    endcase
  notif1 (id_0, id_5, id_4);
  module_0(
      id_0,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_5,
      id_4,
      id_2,
      id_5,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_5,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_4,
      id_1,
      id_0
  );
endmodule

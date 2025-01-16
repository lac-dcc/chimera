// Seed: 845686200
module module_0 (
    input tri0 id_0,
    id_18,
    input uwire void id_1,
    input tri id_2,
    output tri1 id_3,
    id_19,
    input wand id_4,
    input wire id_5,
    id_20,
    output supply0 id_6,
    input uwire id_7,
    input supply0 id_8,
    id_21,
    output tri0 id_9,
    output tri id_10,
    input wand id_11,
    output wire id_12,
    output uwire id_13,
    input supply1 id_14,
    input tri id_15,
    output supply1 id_16
);
  wire id_22;
  parameter id_23 = id_21;
  wire id_24;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    id_9,
    output tri id_1,
    input wire id_2,
    input supply0 id_3,
    output logic id_4,
    input wire id_5,
    input tri id_6,
    output uwire id_7
);
  id_10(
      1, 1'd0, id_5, id_1, -1
  );
  always wait (id_5.id_2) #1 if (id_6) id_1 = 1;
  always id_4 <= -1 - 1'h0;
  wire id_11;
  wire id_12;
  supply1 id_13, id_14, id_15 = 1;
  wire id_16;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_1,
      id_6,
      id_2,
      id_7,
      id_3,
      id_2,
      id_7,
      id_7,
      id_5,
      id_7,
      id_1,
      id_3,
      id_2,
      id_0
  );
  assign id_9 = id_14;
endmodule

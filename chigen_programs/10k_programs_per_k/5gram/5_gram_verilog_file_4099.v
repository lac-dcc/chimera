// Seed: 4088367470
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output wire id_2,
    output wire id_3,
    input tri id_4,
    input wire id_5,
    input uwire id_6,
    input wor id_7,
    input wand id_8,
    input supply0 id_9,
    output supply0 id_10,
    input supply0 id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri1 id_14,
    input supply1 id_15,
    input tri id_16,
    input tri id_17,
    output supply1 id_18,
    input tri1 id_19
);
  wand id_21 = id_16, id_22;
  assign id_2 = 1 ? id_15 : id_16;
  wire id_23;
  assign module_1.type_15 = 0;
  wire id_24;
endmodule
module module_1 (
    output wor id_0,
    input tri id_1,
    output logic id_2,
    input wor id_3,
    input logic id_4,
    output supply0 id_5,
    output uwire id_6,
    output tri0 id_7,
    input uwire id_8,
    input wire id_9,
    input wand id_10
);
  string id_12;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_5,
      id_5,
      id_1,
      id_9,
      id_3,
      id_9,
      id_1,
      id_8,
      id_0,
      id_1,
      id_1,
      id_3,
      id_0,
      id_3,
      id_3,
      id_8,
      id_5,
      id_10
  );
  always @(posedge ~id_4 or negedge 1) id_12 = "";
  always id_2 = @(1) id_4;
endmodule

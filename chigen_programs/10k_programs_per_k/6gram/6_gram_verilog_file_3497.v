// Seed: 4245634860
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    input wire id_2,
    input tri1 id_3,
    output supply0 id_4,
    input wire id_5,
    input wor id_6,
    input wire id_7,
    input wire id_8,
    input supply1 id_9,
    input uwire id_10,
    input supply1 id_11,
    input wand id_12,
    input tri1 id_13,
    output uwire id_14
);
  wire id_16;
  wire id_17;
  always @(id_3 or "") begin : LABEL_0
    wait (id_10);
  end
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wor id_6,
    input wire id_7,
    input tri id_8,
    output logic id_9,
    output wor id_10
);
  or primCall (id_6, id_5, id_3, id_2);
  always repeat (1'h0) id_9 = id_3;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_7,
      id_0,
      id_1,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_4,
      id_3,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule

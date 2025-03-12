// Seed: 2550721206
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    input wor id_4,
    output tri0 id_5,
    output uwire id_6
);
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input supply0 id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri0 id_5,
    input wire id_6,
    input tri1 id_7,
    output logic id_8,
    input supply1 id_9,
    output tri1 id_10,
    input supply1 id_11,
    input wand id_12,
    input wire id_13,
    input supply0 id_14
);
  task id_16;
    input id_17;
    integer id_18;
    begin : LABEL_0
      id_8 = #id_19 id_3;
    end
  endtask
  module_0 modCall_1 (
      id_7,
      id_2,
      id_6,
      id_2,
      id_2,
      id_10,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule

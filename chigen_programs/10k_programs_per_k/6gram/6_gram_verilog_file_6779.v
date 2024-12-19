// Seed: 3452399394
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output uwire id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_10,
      id_5,
      id_6,
      id_5
  );
  assign id_10 = 1;
  always @(posedge 1) id_0 = #1  !id_9;
endmodule

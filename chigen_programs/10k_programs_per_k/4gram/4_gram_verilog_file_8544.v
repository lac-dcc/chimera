// Seed: 3965796774
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    input supply0 module_0,
    input wire id_4,
    input wand id_5,
    output supply0 id_6,
    output supply1 id_7,
    input wor id_8
);
  wire id_10;
  ;
  assign id_7 = id_4;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wor id_2,
    output wire id_3,
    output logic id_4,
    output supply0 id_5,
    output logic id_6,
    input tri0 id_7,
    input supply0 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  always @(id_9) begin : LABEL_0
    id_4 = -1;
    id_6 <= id_8;
    id_1 <= id_8;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_7,
      id_9,
      id_7,
      id_2,
      id_5,
      id_3,
      id_0
  );
endmodule

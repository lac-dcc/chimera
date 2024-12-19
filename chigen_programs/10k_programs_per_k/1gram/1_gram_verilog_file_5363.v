// Seed: 4051268052
module module_0 (
    input  uwire id_0,
    output wire  id_1
);
  assign id_1 = 1;
  assign module_1.type_21 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input wire id_2,
    input tri id_3,
    input wand id_4,
    output supply0 id_5,
    input wor id_6,
    input supply1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input supply0 id_10,
    input wand id_11,
    input tri0 id_12
);
  assign id_5 = 1;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_11,
      id_5
  );
  always begin : LABEL_0
    fork
      @(posedge id_12 >> id_4 or id_3 or id_12 or posedge 1) id_0 <= 1'h0;
    join
  end
endmodule

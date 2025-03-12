// Seed: 1015305215
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_5 = 0;
  integer id_3;
  ;
  assign module_2.id_3 = 0;
  logic id_4 = 1;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input wire id_2,
    output wand id_3,
    input wand id_4,
    output logic id_5,
    input tri id_6
);
  always @(posedge id_6 or posedge id_0) begin : LABEL_0
    id_5 <= 1;
  end
  logic id_8;
  ;
  module_0 modCall_1 (
      id_8,
      id_8
  );
endmodule
module module_2 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output logic id_4
);
  wire id_6;
  always @(posedge 1) begin : LABEL_0
    id_4 <= 1;
    #1 id_4 = 1;
  end
  assign id_4 = 1'b0;
  wire id_7;
  xor primCall (id_4, id_0, id_3, id_7);
  module_0 modCall_1 (
      id_7,
      id_6
  );
  assign id_6 = id_6;
endmodule

// Seed: 1576372896
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    input wire id_5
);
  wire id_7;
  wire id_8;
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output wor id_0,
    output logic id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri id_6,
    input wor id_7,
    output uwire id_8
);
  wire id_10;
  always @(posedge id_10 or posedge -1) begin : LABEL_0
    id_1 <= id_6;
  end
  assign id_0 = -1;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_0,
      id_6,
      id_8,
      id_5
  );
endmodule

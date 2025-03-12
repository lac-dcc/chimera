// Seed: 3229245208
module module_0 (
    input tri id_0,
    output uwire id_1,
    output supply1 id_2
);
  logic id_4;
  logic [1 : -1] id_5;
  parameter id_6 = -1;
  assign id_2 = -1;
  logic id_7;
  ;
  always @(-1 or posedge id_4[1]) begin : LABEL_0
    if (1) disable id_8;
  end
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    output logic id_2,
    input supply1 id_3
);
  always @(posedge ~id_3, -1) begin : LABEL_0
    id_2 <= id_0;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
endmodule

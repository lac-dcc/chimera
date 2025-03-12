// Seed: 1379839619
module module_0 (
    input tri1 id_0
);
  localparam id_2 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  supply1 id_0,
    output logic   id_1,
    input  supply1 id_2,
    output logic   id_3,
    input  supply1 id_4
);
  module_0 modCall_1 (id_0);
  assign id_3 = $unsigned(87);
  ;
  always @(*) begin : LABEL_0
    id_3 = id_0;
    if (1) begin : LABEL_1
      id_1 <= -1;
    end else id_3 <= 1;
  end
endmodule
module module_2 (
    output uwire id_0,
    output wire id_1,
    output supply1 id_2,
    input tri id_3,
    input supply1 id_4,
    output logic id_5
);
  xnor primCall (id_2, id_3, id_4);
  always @(id_4) id_5 = id_3;
  module_0 modCall_1 (id_3);
endmodule

// Seed: 1079487768
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  assign module_2.id_0 = 0;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  ;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always @("" or posedge id_1) begin : LABEL_0
    wait (1);
  end
  assign id_2 = id_2;
  buf primCall (id_1, id_2);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 (
    input tri1 id_0
);
  wire [1 : 1] id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule

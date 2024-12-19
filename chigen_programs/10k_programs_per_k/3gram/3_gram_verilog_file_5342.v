// Seed: 4222063036
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = !id_1;
  assign id_1 = 1;
  assign id_2 = id_1;
  assign module_1.id_1 = 0;
  assign id_1 = id_2;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wire id_4,
    input tri1 id_5
);
  initial begin : LABEL_0
  end
  logic [7:0] id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8
  );
  wire id_9;
  assign (strong1, strong0) id_7[1] = id_8;
endmodule

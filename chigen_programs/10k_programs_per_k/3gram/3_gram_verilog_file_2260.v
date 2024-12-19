// Seed: 3542777262
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_4;
  assign module_1.id_1 = 0;
  timeprecision 1ps;
  module_2 modCall_1 (
      id_4,
      id_2,
      id_4
  );
  initial begin : LABEL_0
    if (id_4) id_4 <= 1;
  end
endmodule
module module_1;
  supply1 id_1, id_2;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(("") or posedge id_3 <= 1 && 1'b0 || id_3) id_3 <= 1'b0;
  assign module_0.id_4 = 0;
  assign id_1 = id_3;
  wire id_4;
endmodule

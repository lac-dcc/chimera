// Seed: 1805552073
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_5;
  logic [7:0] id_6;
  wire id_7;
  module_2 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_3,
      id_4
  );
  assign id_2 = !id_6["" : 1] * id_5 != id_5;
  wire id_8;
  assign module_1.type_5 = 0;
  assign id_3 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  assign id_1[1] = 1'b0;
  id_7(
      .id_0(1), .id_1(1), .id_2(1'd0), .id_3(id_2), .id_4(id_1)
  );
  assign module_0.id_3 = 0;
endmodule

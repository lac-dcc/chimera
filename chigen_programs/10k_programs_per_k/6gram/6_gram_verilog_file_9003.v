// Seed: 2099037503
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  tri1 id_5;
  always
    case ((id_5 == 1))
      1'b0: id_2 = id_4;
      id_3: id_4 = id_4;
      id_4: id_3 = id_1;
      default: id_3 = 1;
    endcase
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = id_3 ? id_3 : id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule

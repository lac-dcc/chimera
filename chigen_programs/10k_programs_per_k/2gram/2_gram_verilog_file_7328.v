// Seed: 328387426
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  xnor (id_2, id_6, id_8, id_1, id_4, id_9, id_5, id_3);
  module_0(
      id_2
  );
endmodule
module module_2 (
    input uwire   id_0,
    input supply0 id_1,
    input supply0 id_2
);
  always_comb begin : id_4
    id_4 <= 1 * id_0;
  end
  assign id_5 = 1;
  module_0(
      id_5
  );
endmodule

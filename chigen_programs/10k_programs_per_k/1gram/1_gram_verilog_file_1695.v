// Seed: 497268809
module module_0 (
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
  wire id_6, id_7;
  wire id_8;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    assign id_1 = id_2;
    begin
      initial assign id_1 = id_3[1];
    end
  endgenerate
  module_0(
      id_1, id_2, id_2, id_1, id_2
  );
  assign id_1 = 1;
  wire id_4;
endmodule

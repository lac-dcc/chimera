// Seed: 673635158
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = (id_2);
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  module_0(
      id_2, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(*) begin
    id_2 <= 1;
  end
  wire id_5;
  module_0(
      id_4, id_1
  );
  assign id_4 = 1;
endmodule

// Seed: 600417169
module module_0 (
    id_1
);
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial id_2 = #1 1;
  module_0(
      id_5
  );
  always begin
    id_5 = id_3 & 1;
  end
endmodule
module module_2;
  assign id_1 = id_1;
  id_2(
      .sum(1), .id_0(id_1), .id_1(1'b0), .id_2(1), .id_3(id_1), .id_4(id_3), .id_5(1 || 1)
  ); module_0(
      id_1
  );
  wire id_4;
  wire id_5;
endmodule

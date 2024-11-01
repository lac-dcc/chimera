// Seed: 2215192130
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_8 = id_6;
  module_0(
      id_8, id_6
  );
  always
    if (id_7) @(posedge 1 or id_2) @(*);
    else begin
      assert (1);
    end
endmodule

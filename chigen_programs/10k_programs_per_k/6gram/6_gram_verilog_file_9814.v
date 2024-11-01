// Seed: 3761659316
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  wire id_10;
  assign id_7 = 1;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8;
  module_0(
      id_3, id_6, id_6, id_6, id_7, id_5, id_6
  );
  always @(posedge "") begin
    if (id_6) id_4 = id_7;
  end
  assign id_2 = id_1 ? 1 : id_3 == id_5 + id_3 - 1'b0;
endmodule

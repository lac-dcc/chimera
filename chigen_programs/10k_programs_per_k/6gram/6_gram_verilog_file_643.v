// Seed: 2370821347
module module_0 ();
  reg id_1;
  always @(id_1 or {(id_1 && 1 == 1'b0) {1}}) id_1 = #1 id_1;
  assign id_1 = 1;
  always #({0{1}}) begin
    assert (1);
  end
  reg id_2;
  assign id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1 == id_5 ? id_2 : id_2;
  module_0();
  wire id_7;
endmodule

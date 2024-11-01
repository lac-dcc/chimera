// Seed: 2138332598
module module_0 ();
  reg  id_1 = id_1;
  wire id_2;
  reg  id_3 = id_1;
  always #1 begin
    id_1 <= (1) ? 1'b0 : {{id_3, 1}, 1};
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final begin
    if (id_2) id_4 <= id_3 ? id_6 : id_7 ? id_6 : 1 == id_7 ? 1 : {1{~id_7}} ? 1 : id_6;
    else id_1 <= 1;
  end
  module_0();
endmodule

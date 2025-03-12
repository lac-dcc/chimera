// Seed: 105392509
program module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_4 = 1;
  wire id_5, id_6;
  wire id_7, id_8;
endprogram
module module_1 ();
  union packed {logic id_1;} id_2[-1 'b0 : 1];
  logic id_3;
  ;
  logic id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout reg id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7
  );
  final id_4 <= #1 id_6 ^ -1 > -1;
endmodule

// Seed: 3787824878
module module_0 (
    output uwire id_0,
    input  tri0  id_1
);
  assign id_0 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    output uwire id_2,
    output wire  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    output tri0  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5
  );
  notif1 primCall (id_6, id_4, id_8);
  assign id_2 = 1;
endmodule
module module_2 ();
  wire id_1;
  ;
  logic id_2;
endmodule
module module_3 #(
    parameter id_1 = 32'd94,
    parameter id_3 = 32'd39
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire _id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  wire [-1 : id_1] id_7;
  wire ["" : id_1] id_8;
  logic id_9;
  ;
  assign id_3 = id_6;
  module_2 modCall_1 ();
endmodule

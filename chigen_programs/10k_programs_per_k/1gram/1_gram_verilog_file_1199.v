// Seed: 801787157
module module_0 (
    id_1
);
  inout wire id_1;
  module_2 modCall_1 ();
  wire id_2, id_3;
  assign id_3 = id_1;
endmodule
program module_1 (
    input tri0 id_0,
    output logic id_1,
    input supply0 id_2,
    input supply1 id_3
);
  assign id_1 = 1'b0;
  id_5 :
  assert property (@(*) 1) id_1 = 1;
  logic id_6;
  module_0 modCall_1 (id_5);
  assign id_6.id_5 = 1;
endprogram
module module_2 ();
  logic [7:0][1] id_1;
  ;
  assign module_3.id_0 = 0;
endmodule
module module_3 (
    output logic id_0,
    input  tri   id_1
);
  final
    if (1)
      if (1) id_0 <= ~id_1;
      else id_0 = "";
  module_2 modCall_1 ();
endmodule

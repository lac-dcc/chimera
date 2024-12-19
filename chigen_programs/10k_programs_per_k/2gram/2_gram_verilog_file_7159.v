// Seed: 2087990209
module module_0;
  tri1 id_1;
  assign id_1 = 1;
  tri0 id_3;
  tri1 id_4 = id_1;
  wire id_5;
  wire id_6;
  assign module_2.type_6 = 0;
  wire id_7;
  tri0 id_8 = 1;
endmodule
module module_1 (
    input wire id_0
);
  genvar id_2;
  module_0 modCall_1 ();
  assign modCall_1.type_16 = 0;
endmodule
module module_2 (
    output logic id_0,
    input  wor   id_1,
    input  logic id_2
);
  id_4 :
  assert property (@(posedge 1) 1)
  else;
  always id_0 <= id_2;
  module_0 modCall_1 ();
  id_5(
      .id_0(id_1), .id_1(~id_0), .id_2((id_0)), .id_3(1)
  );
endmodule

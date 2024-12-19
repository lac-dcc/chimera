// Seed: 399902238
module module_0;
  wire id_2;
  assign module_2.id_1 = 0;
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
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_6;
  module_0 modCall_1 ();
endmodule
module module_0 (
    id_1,
    access
);
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  wire module_2;
  module_0 modCall_1 ();
  id_3(
      .id_0(1'd0), .id_1(id_1 ^ id_4)
  );
  always @(posedge 1 or posedge (id_2)) begin : LABEL_0
    if (1) id_4 <= id_2;
  end
  assign id_1 = 1;
endmodule

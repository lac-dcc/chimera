// Seed: 3624285406
module module_0;
  final $display;
  wire id_2;
  always @(posedge 1) begin : LABEL_0
    cover (1);
  end
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  xnor primCall (id_3, id_4, id_5);
  module_0 modCall_1 ();
endmodule
module module_2;
  id_1(
      .id_0(id_2), .id_1(), .id_2(), .id_3(1 == 1'd0)
  );
endmodule

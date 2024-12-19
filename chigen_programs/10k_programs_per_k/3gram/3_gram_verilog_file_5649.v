// Seed: 3697993406
module module_0 ();
  wire id_1;
  assign module_2.id_1 = 0;
  id_2(
      .id_0(id_1), .id_1(1'h0 - 1), .id_2(id_1), .id_3(id_1)
  );
endmodule
module module_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    output logic id_4
);
  module_0 modCall_1 ();
  assign id_1 = id_0;
  always @(posedge 1'b0 or id_3) begin : LABEL_0
    id_4 <= 1;
  end
  genvar id_6;
endmodule

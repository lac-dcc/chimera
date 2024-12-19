// Seed: 1333331985
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  specify
    specparam id_8 = {1{id_7}};
  endspecify
endmodule
module module_1 ();
  id_2(
      .id_0(id_3.id_1), .id_1(1), .id_2(1)
  );
  assign id_1 = 1'b0;
  always @(posedge id_1 or posedge id_3) begin : LABEL_0
    disable id_4;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4
  );
endmodule

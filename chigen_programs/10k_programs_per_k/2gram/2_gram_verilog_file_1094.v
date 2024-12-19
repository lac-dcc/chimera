// Seed: 2985754661
module module_0;
  wire id_2;
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
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_6;
  final begin : LABEL_0
    if (id_3) begin : LABEL_0
      id_3 <= #1 id_3;
    end else assume #1  ({1, id_6});
    @(negedge id_3 or posedge id_4);
    assign id_2 = 1;
    id_2 = 1;
  end
  wire id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule

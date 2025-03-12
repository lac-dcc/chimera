// Seed: 544941067
module module_0 ();
  supply1 id_1 = -1;
  assign module_2.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd50,
    parameter id_3 = 32'd30
) (
    id_1,
    _id_2,
    _id_3
);
  inout wire _id_3;
  output wire _id_2;
  output tri id_1;
  wire id_4;
  logic [id_2 : id_3] id_5;
  module_0 modCall_1 ();
  assign id_1 = -1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 ();
  output reg id_1;
  always_ff @(-1, posedge id_4) begin : LABEL_0
    if (1) begin : LABEL_1
      while (1 != id_4) @(posedge id_3 or posedge -1);
      id_1 = 1;
      disable id_5;
      #1;
    end
  end
endmodule

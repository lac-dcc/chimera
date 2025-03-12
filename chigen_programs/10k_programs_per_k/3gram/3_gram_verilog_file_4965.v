// Seed: 3616012119
module module_0 #(
    parameter id_1 = 32'd17
);
  wire _id_1;
  assign module_2.id_3 = 0;
  wire [1 : id_1] id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  module_0 modCall_1 ();
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = -1;
  wire id_7;
  ;
  wire id_8 = id_7;
  wire id_9 = id_5;
endmodule
module module_2 #(
    parameter id_1 = 32'd45
) (
    input wire id_0,
    input wire _id_1
);
  bit [-1 : id_1] id_3 = id_1(1, -1);
  always @(id_0);
  if (1)
    always
      if (1) begin : LABEL_0
        id_3 <= id_0;
      end else id_3 <= id_3;
  module_0 modCall_1 ();
  always @(1 or negedge id_0) begin : LABEL_1
    begin : LABEL_2
      id_3 <= -1;
    end
    id_3 = 1'b0;
  end
endmodule

// Seed: 3982199152
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  assign module_1.id_7 = 0;
  input wire id_1;
  logic id_5;
  logic id_6;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd75,
    parameter id_7 = 32'd10
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire _id_3;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_6,
      id_1
  );
  inout logic [7:0] id_2;
  input wire id_1;
  always @(!id_4 or posedge id_2[id_7 :-1]) begin : LABEL_0
    if (1)
      repeat (-1) begin : LABEL_1
        $clog2(3);
        ;
      end
  end
  logic [id_3 : 1] id_8;
  ;
  assign id_8 = 1;
endmodule

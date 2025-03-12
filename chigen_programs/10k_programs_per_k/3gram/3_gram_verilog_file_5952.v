// Seed: 4210162877
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd2
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire _id_2;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5,
      id_9,
      id_9,
      id_6,
      id_7
  );
  output wire id_1;
  always_comb @(-1 - -1 or posedge id_4[id_2] ^ id_8) begin : LABEL_0
    $signed(39);
    ;
  end
endmodule

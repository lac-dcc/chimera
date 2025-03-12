// Seed: 663775023
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output tri id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  assign module_1.id_3 = 0;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_10 = id_2 && -1'h0 === id_6 + 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd97,
    parameter id_7 = 32'd7,
    parameter id_9 = 32'd55
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire _id_3;
  output wire id_2;
  output supply0 id_1;
  wire [-1 : id_7] _id_9;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_4,
      id_4,
      id_4,
      id_4,
      id_6,
      id_6,
      id_4,
      id_2
  );
  always @(*) begin : LABEL_0
    wait ((id_8 == 1 ? 1 : id_7));
    $signed(60);
    ;
  end
  assign id_5[id_9] = id_7 + id_7 ? -1 : -1;
  assign id_5 = id_8;
  logic [id_3 : -1] id_10;
  ;
  assign id_1 = -1'b0 ? -1 <= id_6 : id_7 ? -1'b0 : 1;
endmodule

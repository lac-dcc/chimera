// Seed: 3209993854
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
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  assign id_6 = 1;
  always @(1 or posedge id_9) begin : LABEL_0
    if (~id_8) id_1 <= id_9;
    else begin : LABEL_0
      id_3 <= 1 == 1;
    end
  end
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_10,
      id_6,
      id_6,
      id_7
  );
  wire id_11;
endmodule

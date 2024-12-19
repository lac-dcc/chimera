// Seed: 938938406
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4;
  assign id_1 = id_3;
  wire id_5;
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
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge 0) begin : LABEL_0
    #1
    if (id_10) begin : LABEL_0
      return ~id_6;
    end else id_5 <= id_4;
    assign id_10 = id_4;
  end
  module_0 modCall_1 (
      id_10,
      id_6
  );
endmodule

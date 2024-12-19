// Seed: 3303694320
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
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  always @(id_3 or posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0$display
      ;
      id_4 <= 1 ? 1 : 1;
    end else begin : LABEL_0
      id_5 <= id_3;
    end
    $display;
  end
  module_0 modCall_1 (
      id_7,
      id_2,
      id_7,
      id_2,
      id_6,
      id_7,
      id_2,
      id_1,
      id_7,
      id_7
  );
endmodule

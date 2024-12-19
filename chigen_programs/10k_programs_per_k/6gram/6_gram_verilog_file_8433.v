// Seed: 4247122727
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
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = 1'h0;
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
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_6,
      id_3,
      id_4,
      id_6,
      id_5,
      id_3,
      id_6
  );
  generate
    if (1 == 1 - 1) begin : LABEL_0
      wire id_7;
      wire id_8;
      always @* force id_6 = id_2;
      assign id_3 = 1;
    end else begin : LABEL_0
      supply1 id_9 = 1;
    end
  endgenerate
endmodule

// Seed: 1068434637
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_8 = id_4;
  assign module_1.id_4 = 0;
  wire id_9, id_10;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    input supply0 id_6
);
  wire id_8;
  reg  id_9;
  reg  id_10;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_8,
      id_11,
      id_8,
      id_8
  );
  assign id_8 = ~id_2;
  always @(posedge "" or negedge 1) release id_10;
  always @(1 or posedge 1'b0) begin : LABEL_0
    id_9 <= 1'b0;
    id_1 <= id_10;
  end
endmodule

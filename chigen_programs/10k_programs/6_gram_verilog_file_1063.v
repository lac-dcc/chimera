// Seed: 3364200330
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  reg  id_7;
  wire id_8;
  always disable id_9;
  assign id_2 = id_4 - id_6;
  always @(id_6) begin
    id_3 = 1;
    id_7 = #id_10 1;
  end
  wire id_11;
  assign id_7 = 1'd0;
  wire id_12;
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
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wand id_7;
  module_0(
      id_4, id_6, id_7, id_2, id_6, id_2
  );
  wire id_8;
  always @(negedge 1 or posedge id_5) id_3 <= id_1 < id_7;
endmodule

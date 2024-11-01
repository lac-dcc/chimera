// Seed: 394736311
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign id_2 = 1;
  assign id_1 = 1;
  wire id_7;
  always @(posedge 1) begin
    id_3 <= 1;
    disable id_8;
    id_1 = id_5 == 1;
    id_1 <= #1 1'b0;
    id_3 = 1;
  end
endmodule
module module_1 (
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
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(negedge 1) begin
    if (id_2) begin
      id_6 <= 1 == 1;
    end
  end
  module_0(
      id_6, id_6, id_6, id_2, id_4, id_2
  );
endmodule

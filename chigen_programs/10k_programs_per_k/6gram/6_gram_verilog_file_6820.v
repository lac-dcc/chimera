// Seed: 1951616048
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
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_8 = 1;
  wire id_9;
  wire id_10;
  always @* begin
    id_5 = id_6;
    id_8 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_6;
  assign id_4 = 1 & id_4;
  always @(negedge id_1 !=? id_4 or posedge 1) begin
    if (1 + 1'h0 + id_1 - id_2) begin
      id_4 <= #id_2 1;
    end
  end
  module_0(
      id_2, id_1, id_3, id_2, id_1, id_2, id_2, id_6
  );
  assign id_6 = id_4;
endmodule

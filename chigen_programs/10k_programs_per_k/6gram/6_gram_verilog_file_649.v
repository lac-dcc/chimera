// Seed: 3325948096
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
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire  id_9;
  wire  id_10;
  uwire id_11;
  assign id_8  = 1;
  assign id_10 = id_6;
  assign id_11 = 1;
  wire id_12 = (id_7);
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  logic id_2,
    input  wand  id_3,
    input  logic id_4
);
  always @(negedge id_1) id_0 <= #id_3 id_4;
  assign id_0 = 1;
  wire id_6;
  initial begin
    $display(id_4, id_2, id_4);
    if (id_4) begin
      id_0 += 1;
    end else
      #1 begin
        id_0 <= 1;
      end
  end
  module_0(
      id_6, id_6, id_6, id_6, id_6, id_6, id_6, id_6
  );
endmodule

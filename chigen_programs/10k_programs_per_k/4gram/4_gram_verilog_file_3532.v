// Seed: 891661214
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
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_8 = id_6;
    wire id_9;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_1 or posedge 1'h0) begin
    id_5 <= 1;
  end
  wire id_6 = id_2;
  module_0(
      id_2, id_1, id_1, id_2, id_1, id_2, id_6, id_6
  );
  reg  id_7;
  wand id_8 = 1;
  wand id_9;
  wand id_10 = 1;
  final begin
    id_7 <= id_3;
    while (1) begin
      begin
        $display(1 == id_9);
      end
    end
  end
  assign id_7 = id_4;
endmodule

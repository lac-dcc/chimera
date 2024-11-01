// Seed: 1708677485
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin
    begin
      disable id_6;
    end
  end
  wire id_7, id_8;
  assign id_3 = 1'h0;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  always @(~id_1 or posedge 1) $display;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_3 or posedge id_6) begin
    id_5 <= 1;
    $display(1 * {id_2, id_2, 1} - 1, (id_6));
  end
  module_0(
      id_3, id_6, id_3, id_2, id_1
  );
endmodule

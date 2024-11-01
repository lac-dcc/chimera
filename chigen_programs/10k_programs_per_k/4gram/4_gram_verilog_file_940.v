// Seed: 1496817524
module module_0 ();
  reg id_2;
  always @(id_1) if (1) id_2 = id_1;
  always
    repeat (id_2)
      if (1'b0) begin
        id_2 = 1;
      end else begin
        fork
          $display(id_1);
          if (1'h0) begin
            id_1 <= 1'b0;
          end
        join
      end
  assign id_1 = 1;
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  module_0();
endmodule

// Seed: 2097214483
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_ff #1 if (id_2) disable id_5;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always #1
    @(posedge 1) begin
      id_1 = id_5;
    end
  module_0(
      id_4, id_4, id_3, id_4
  );
endmodule

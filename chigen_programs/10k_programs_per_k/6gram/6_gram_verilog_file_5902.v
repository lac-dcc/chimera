// Seed: 3892780784
module module_0 (
    id_1
);
  output wire id_1;
  always @(negedge 1) begin
    id_1 <= (1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1'b0) begin
    id_7 = #id_8 |id_6;
  end
  and (id_4, id_1, id_7, id_6, id_2);
  module_0(
      id_7
  );
endmodule

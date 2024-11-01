// Seed: 2278667613
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
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
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_6 or posedge 1) begin
    id_4 = 1;
    id_2 <= ~id_2;
  end
  xnor (id_5, id_4, id_6, id_2, id_1);
  assign id_2 = 1;
  assign id_5 = 1'b0;
  module_0(
      id_4, id_1, id_1, id_4, id_1, id_4, id_5
  );
endmodule

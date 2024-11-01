// Seed: 1154113455
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  always @(negedge 1) begin
    id_3[1 : 1] = id_1;
  end
  always @(posedge 1 or(id_1)) if (id_1) deassign id_5[""];
  module_0(
      id_4, id_5, id_5, id_4, id_1, id_4
  );
endmodule

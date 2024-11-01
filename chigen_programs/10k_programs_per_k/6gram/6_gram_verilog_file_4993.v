// Seed: 3429874444
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_4;
  assign id_1 = id_4;
  reg id_5;
  assign id_4 = !id_4;
  always @(id_2 or posedge 1) begin
    if (1) id_5 <= "";
    else #0 id_1 = #1 id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  always @(posedge 1) id_3 = #1 1;
  module_0(
      id_3, id_1, id_4
  );
endmodule

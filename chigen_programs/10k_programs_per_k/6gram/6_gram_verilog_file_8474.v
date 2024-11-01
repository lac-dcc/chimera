// Seed: 2594807384
module module_0 #(
    parameter id_8 = 32'd54,
    parameter id_9 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  tri1 id_6;
  always
    if (id_2) begin
      deassign id_1;
    end else id_2 <= 1;
  wire id_7;
  defparam id_8.id_9 = 1;
  wire id_10;
  function automatic id_11;
    input id_12;
    input id_13;
    id_10 = id_7;
  endfunction
  always @(negedge 1) if (id_6) id_2 <= (1);
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
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(id_4 or posedge 1) begin
    id_2 <= id_4;
  end
  module_0(
      id_5, id_4, id_3, id_6, id_1
  );
endmodule

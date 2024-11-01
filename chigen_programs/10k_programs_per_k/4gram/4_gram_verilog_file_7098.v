// Seed: 213454292
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  function integer id_16(input id_17);
    assign id_9 = id_14 - 1;
  endfunction
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  always @(posedge id_3) begin
    assert (id_2);
  end
  module_0(
      id_3, id_2, id_2, id_1, id_3, id_2, id_3, id_3, id_3, id_3, id_2, id_3, id_2, id_3, id_2
  );
endmodule

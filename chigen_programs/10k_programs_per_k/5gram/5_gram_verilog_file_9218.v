// Seed: 3955083062
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_ff @(posedge id_2) begin
    release id_3;
  end
endmodule
module module_1 (
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_11[1'b0];
  wire id_13;
  module_0(
      id_8, id_7, id_8
  );
  assign id_3 = 1 + id_2;
  assign id_1 = 1;
  wire id_14;
  id_15 :
  assert property (@(posedge id_2++ == 1) 1)
  else $display(id_2 < 1);
endmodule

// Seed: 942458843
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_20 = 1 + 1'b0;
  assign id_2  = id_5;
  if (id_16++) begin : id_23
    always #1 id_21 <= 1;
  end
  id_24 :
  assert property (@(id_6) 1)
  else begin
    id_4 <= 1;
  end
  wire id_25;
  assign id_16 = 1'h0;
  wire id_26 = id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire   id_1
);
  reg id_3;
  assign id_3 = 1;
  always
  fork
    id_3 <= id_1 * {1 == id_1, 1};
  join
  reg  id_4 = id_3;
  wire id_5;
  module_0(
      id_5,
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5
  );
endmodule

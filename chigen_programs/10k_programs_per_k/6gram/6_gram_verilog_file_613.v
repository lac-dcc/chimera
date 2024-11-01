// Seed: 3355666932
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1) begin
    id_4 <= id_2;
    if (id_2) id_4 <= #1 1;
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
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin
    id_6 <= 1'h0;
    id_8 <= id_2;
    $display(id_8, 1, 1);
    wait (id_2);
  end
  module_0(
      id_1, id_6, id_7, id_2, id_1
  );
endmodule

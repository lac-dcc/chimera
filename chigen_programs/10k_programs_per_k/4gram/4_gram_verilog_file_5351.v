// Seed: 801306867
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_7(
      .id_0(id_4), .id_1(1), .id_2(1), .id_3(1)
  );
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  logic id_2,
    input  logic id_3,
    output wand  id_4
);
  initial begin
    if (id_1 == 1'h0) id_0 <= id_3;
    else begin
      if (1 - id_1 * id_2) id_0 <= id_2;
      else begin
        id_4 = id_1;
      end
    end
  end
  reg  id_6 = 1'b0;
  wire id_7;
  xor (id_4, id_7, id_1, id_3, id_6, id_8, id_2);
  assign id_0 = 1;
  reg id_8;
  always @(posedge 1) begin
    id_6 <= id_8;
  end
  module_0(
      id_7, id_7, id_7, id_7, id_7, id_7
  );
  wire id_9;
endmodule

// Seed: 589272622
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  module_0(
      id_4, id_6, id_5
  );
endmodule
module module_2 (
    output logic id_0,
    output tri1 id_1,
    output uwire id_2,
    output wor id_3,
    input wor id_4,
    input logic id_5,
    output logic id_6,
    output supply0 id_7,
    input wand id_8
);
  wire id_10;
  initial begin
    #1 id_7 = 1;
  end
  always
  fork
    id_10 = id_10;
    @(posedge id_4) begin
      id_7 = id_4;
    end
    if (1'h0) id_6 <= id_5;
    else begin
      if (1) begin
        id_0 <= id_4 & 1'b0;
      end
    end
    id_6 = 1;
    id_2 = 1;
  join
  wire id_11;
endmodule
module module_3 (
    output wire  id_0,
    input  wire  id_1,
    output logic id_2,
    input  logic id_3
);
  always @(id_1 << id_3, posedge 1 + 1) begin
    id_2 <= (id_3);
    id_2 = 1'b0 && ~1;
  end
  module_2(
      id_2, id_0, id_0, id_0, id_1, id_3, id_2, id_0, id_1
  );
endmodule

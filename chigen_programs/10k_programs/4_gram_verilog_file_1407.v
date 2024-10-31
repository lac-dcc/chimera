// Seed: 2718959991
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output logic id_2
);
  always_latch @(posedge 1) begin
    casez (1)
      1: id_2 <= id_1;
      id_1: begin
        #1;
        if (1) id_0 <= 1 - id_1;
        else begin
          id_0 = 1;
        end
      end
      1'h0: id_0 = id_1 <-> id_1;
      1: id_2 = id_1;
    endcase
  end
  assign id_0 = id_1;
  wire id_4;
  module_0(
      id_4, id_4, id_4, id_4
  );
endmodule

// Seed: 861672333
module module_0 (
    output reg id_0,
    output reg id_1,
    output id_2,
    input reg id_3,
    input id_4,
    input reg id_5
);
  initial begin
    id_1 <= 1;
  end
  type_13(
      id_5, 1, id_1
  );
  reg   id_6;
  logic id_7;
  always @(posedge (!id_6) or negedge 1) begin
    id_0 = id_5;
    id_6 = 1'b0;
    id_0 <= id_3;
    if (id_7#(.id_5(id_4))) id_6 <= 1;
    else begin
      id_7 = "" & "";
      id_6 = 1;
    end
  end
  assign id_0 = 1;
  logic id_8;
endmodule

// Seed: 3515771043
module module_0 (
    input  id_0,
    input  id_1,
    input  id_2,
    output id_3
);
  type_7(
      1, id_3, id_2
  );
  reg id_4;
  always @(1 or posedge id_0) begin
    #1;
    case (1)
      !id_2: id_3 = 1;
      1'b0: begin
        id_3 <= 1;
      end
      1: id_4 = 1;
      default: ;
    endcase
  end
  reg   id_5 = 1;
  logic id_6;
  initial begin
    id_4 <= id_5;
    id_3 <= 1;
    id_4 = 1;
  end
endmodule

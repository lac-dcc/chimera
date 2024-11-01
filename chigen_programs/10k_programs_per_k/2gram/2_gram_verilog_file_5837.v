// Seed: 143274242
module module_0;
  assign id_1 = 1'b0;
  always begin
    id_1 = 1;
    id_1 <= 1'h0;
  end
  reg id_2;
  always begin
    case (1)
      id_2: id_2 <= "";
      id_1: id_1 = 1;
      1: id_1 = new(1);
    endcase
    @(1'b0 or negedge id_2) begin
      if (id_2) begin
        #1;
        id_2 <= 1'd0;
      end
    end
    id_1 <= 1'b0 + (~id_2);
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0();
  always begin
    id_2  <= id_3;
    id_10 <= 1;
  end
endmodule

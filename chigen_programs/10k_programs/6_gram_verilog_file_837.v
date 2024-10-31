// Seed: 3283169225
module module_0;
  always @(~id_1 or negedge 1)
    case (id_1)
      1: id_1 <= (id_1 * id_1);
      1: id_1 = 1'b0;
      1: begin
        #1;
      end
    endcase
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply1 id_3
);
  reg id_5;
  module_0();
  always #1 begin
    #1
    #1
    if (1) id_5 <= #1 1;
    else begin
      #1;
      id_5 <= 1;
    end
  end
  assign id_5 = (1) << 1;
endmodule

// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module counter_down6(in, clk, load, en, clearn, count, tc, count_end);
  input wire [3:0] in;
  input wire clk, load, en, clearn;
  output reg [3:0] count;
  output wire tc;
  output wire count_end;
  
  assign count_end = (count == 4'b0000) ? 1'b1 : 1'b0;
  assign tc = en & count_end;

  always @ (posedge clk)
  begin
    if(!clearn)
        count = 4'b0000;
    if (en) begin
      case (count)
        4'b0101: begin
          count <= 4'b0100;
        end // 5 -> 4
        4'b0001: begin 
          count <= 4'b0000;
        end  // 1 -> 0
        4'b0000: begin
          count <= 4'b0101;
        end // 0 -> 5
        default: count <= count - 4'b0001;
      endcase
    end else begin
      if(load) // Lembrar q aq o valor do load tá invertido
        count <= in;
    end
  end
endmodule

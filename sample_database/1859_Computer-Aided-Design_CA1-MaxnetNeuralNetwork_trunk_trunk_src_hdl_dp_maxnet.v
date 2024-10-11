// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module DataPath (
    input clk, rst,
    input selA,result_signal,mem_en,ready_sig,
    output reg done
  );


  wire [31:0] result [0:3];
  wire [31:0] a_mem [0:3];
  wire [31:0] a [0:3];
  wire [31:0] weights [0:3][0:3];
  wire res0_zero,res1_zero,res2_zero,res3_zero; 


  memory mem (
      .w_out(weights),
      .a_out(a_mem),
      .mem_en(mem_en)
    ); 

  Mux2to1 mux1(
    .sel(selA),
    .a0(result[0]),
    .a1(a_mem[0]),
    .out(a[0])
  );

   Mux2to1 mux2(
    .sel(selA),
    .a0(result[1]),
    .a1(a_mem[1]),
    .out(a[1])
  );

   Mux2to1 mux3(
    .sel(selA),
    .a0(result[2]),
    .a1(a_mem[2]),
    .out(a[2])
  );

   Mux2to1 mux4(
    .sel(selA),
    .a0(result[3]),
    .a1(a_mem[3]),
    .out(a[3])
  );


  PU PU0 (
            .clk(clk),
            .rst(rst),
            .a1(a[0]),
            .a2(a[1]),
            .a3(a[2]),
            .a4(a[3]),
            .result_signal(result_signal),
            .w1(weights[0][0]),
            .w2(weights[0][1]),
            .w3(weights[0][2]),
            .w4(weights[0][3]),
            .result(result[0])
          );

  PU PU1 (
            .clk(clk),
            .rst(rst),
            .a1(a[0]),
            .a2(a[1]),
            .a3(a[2]),
            .a4(a[3]),
            .result_signal(result_signal),
            .w1(weights[1][0]),
            .w2(weights[1][1]),
            .w3(weights[1][2]),
            .w4(weights[1][3]),
            .result(result[1])
          );

  PU PU2 (
            .clk(clk),
            .rst(rst),
            .a1(a[0]),
            .a2(a[1]),
            .a3(a[2]),
            .a4(a[3]),
            .result_signal(result_signal),
            .w1(weights[2][0]),
            .w2(weights[2][1]),
            .w3(weights[2][2]),
            .w4(weights[2][3]),
            .result(result[2])
          );

  PU PU3 (
            .clk(clk),
            .rst(rst),
            .a1(a[0]),
            .a2(a[1]),
            .a3(a[2]),
            .a4(a[3]),
            .result_signal(result_signal),
            .w1(weights[3][0]),
            .w2(weights[3][1]),
            .w3(weights[3][2]),
            .w4(weights[3][3]),
            .result(result[3])
          );

assign res0_zero = ~(|result[0]) ? 1'b0 : 1'b1;
assign res1_zero = ~(|result[1]) ? 1'b0 : 1'b1;
assign res2_zero = ~(|result[2]) ? 1'b0 : 1'b1;
assign res3_zero = ~(|result[3]) ? 1'b0 : 1'b1;

always @(res0_zero or res1_zero or res2_zero or res3_zero)
  begin
    case ({res0_zero,res1_zero,res2_zero,res3_zero})
      4'b0001:
        done = 1'b1;
      4'b0010:
        done = 1'b1;
      4'b0100:
       done = 1'b1;
      4'b1000:
        done = 1'b1;
      default:
      done = 1'b0;
    endcase
  end

always @(posedge ready_sig)
  begin
    done = 1'b0;
    // res0_zero = 1'b1;
    // res1_zero = 1'b1;
    // res2_zero = 1'b1;
    // res3_zero = 1'b1;
  end

endmodule
